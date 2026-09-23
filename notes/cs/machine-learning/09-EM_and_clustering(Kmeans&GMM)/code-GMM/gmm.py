import numpy as np
from typing import NamedTuple, Union, Literal


class GMMState(NamedTuple):
    """Parameters to a GMM Model."""
    pi: np.ndarray  # [K]
    mu: np.ndarray  # [K, d]
    sigma: np.ndarray  # [K, d, d]



def train_gmm(train_data: np.ndarray,
              init_pi: np.ndarray,
              init_mu: np.ndarray,
              init_sigma: np.ndarray,
              *,
              num_iterations: int = 50,
              ) -> GMMState:
    """Fit a GMM model.

    Arguments:
        train_data: A numpy array of shape (N, d), where
            N is the number of data points
            d is the dimension of each data point. Note: you should NOT assume
              d is always 3; rather, try to implement a general K-means.
        init_pi: The initial value of pi. Shape (K, )
        init_mu: The initial value of mu. Shape (K, d)
        init_sigma: The initial value of sigma. Shape (K, d, d)
        num_iterations: Run EM (E-steps and M-steps) for this number of
            iterations.

    Returns:
        A GMM parameter after running `num_iterations` number of EM steps.
    """
    # Sanity check
    N, d = train_data.shape
    K, = init_pi.shape
    assert init_mu.shape == (K, d)
    assert init_sigma.shape == (K, d, d)

    pi, mu, sigma = init_pi.copy(), init_mu.copy(), init_sigma.copy()

    ###########################################################################
    # EM algorithm for learning GMM.
    ###########################################################################
    from scipy.stats import multivariate_normal
    from scipy.special import logsumexp
    from scipy.linalg import det, inv
    total_log_likelihood = []
    
    for it in range(num_iterations):
    # E-step
        log_prob = np.zeros((N, K))  # log p(x_n | k)
        for k in range(K):
            log_prob[:, k] = np.log(pi[k] + 1e-10) + multivariate_normal.logpdf(train_data, mean=mu[k], cov=sigma[k])
        
        log_sum = logsumexp(log_prob, axis=1, keepdims=True)  # shape (N, 1)
        log_gamma = log_prob - log_sum
        gamma = np.exp(log_gamma)  # shape (N, K)

        # M-step
        N_k = np.sum(gamma, axis=0)  # shape (K,)
        pi = N_k / N

        mu = (gamma.T @ train_data) / N_k[:, np.newaxis]  # shape (K, d)

        for k in range(K):
            diff = train_data - mu[k]  # shape (N, d)
            sigma_k = np.einsum('ni,nj->ij', diff * gamma[:, k:k+1], diff) / N_k[k]
            sigma[k] = sigma_k

        total_log_likelihood.append(np.sum(log_sum))
    # Plot the log-likelihood
    import matplotlib.pyplot as plt
    plt.plot(total_log_likelihood)
    plt.xlabel('Iteration')
    plt.ylabel('Log-likelihood')
    plt.title('Log-likelihood vs. Iteration')
    plt.show()
    
    #######################################################################

    return GMMState(pi, mu, sigma)




def compress_image(image: np.ndarray, gmm_model: GMMState) -> np.ndarray:
    """Compress image by mapping each pixel to the mean value of a
    Gaussian component (hard assignment).

    Arguments:
        image: A numpy array of shape (H, W, 3) and dtype uint8.
        gmm_model: type GMMState. A GMM model parameters.
    Returns:
        compressed_image: A numpy array of (H, W, 3) and dtype uint8.
            Be sure to round off to the nearest integer.
    """
    H, W, C = image.shape
    K = gmm_model.mu.shape[0]
    ###########################################################################
    # Implement image compression algorithm using the GMM model
    ##########################################################################
    
    from scipy.stats import multivariate_normal
    from scipy.special import logsumexp
    
    # Flatten the image into (N, 3)
    flat_image = image.reshape(-1, 3).astype(np.float32)

    # Compute log-probability under each Gaussian
    log_probs = np.zeros((flat_image.shape[0], K))  # shape (N, K)
    for k in range(K):
        log_probs[:, k] = multivariate_normal.logpdf(
            flat_image, mean=gmm_model.mu[k], cov=gmm_model.sigma[k]
        ) + np.log(gmm_model.pi[k] + 1e-10)

    # Assign each pixel to the most likely Gaussian (highest log-prob)
    labels = np.argmax(log_probs, axis=1)
    compressed_pixels = gmm_model.mu[labels]

    # Round and clip to valid uint8 range
    compressed_pixels = np.round(compressed_pixels).astype(np.uint8)
    compressed_image = compressed_pixels.reshape(H, W, C)

    
    ##########################################################################

    assert compressed_image.dtype == np.uint8
    assert compressed_image.shape == (H, W, C)
    return compressed_image
