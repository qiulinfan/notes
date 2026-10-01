// 打印 jupyter notebook

```shell
jupyter nbconvert hw.ipynb --to pdf
```



// 打开notebook指令：

```shell
python3 -m IPython notebook
```





添加 channel (清华镜像)：

```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
conda config --set show_channel_urls yes
```


去除 channel:

```shell
conda config --remove channels https://mirrors.tuna.tsinghua.edu.cn/tensorflow/linux/cpu/
```


查看当前 channels:

```shell
conda config --show channels
```


换回默认源:

```shell
conda config --remove-key channels
```

// conda 打开环境

```shell
 conda activate eecs545
```
