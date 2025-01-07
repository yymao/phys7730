# How to run a lab?

## Step 1. Download the lab notebook

First, you need to download the lab notebook:

1. Find the lab you want to run (you can use the navigation bar on the left).
2. Navigate to the lab.
3. Click the download button on the top right corner.
4. Choose the `.ipynb` format.

The notebook will be saved to your computer, but you don't need to open it directly.

## Step 2. Open a terminal

If you are using Windows, you *must* open a terminal by using "Miniforge Prompt" (or "Miniconda Prompt", "Anaconda Prompt") from your Start menu.
A regular Command Prompt or PowerShell window will not work.

If you are using macOS or Linux, you can just open a regular terminal.
You should see `(base)` at the beginning of the command prompt. If you don't see it, you need to activate the base conda environment.

## Step 3. Activate the 7730 environment

Run the following command in the terminal. You can change `conda` to `micromamba` if it complains.

```sh
conda activate 7730
```

## Step 4. Start JupyterLab

Run the following command in the same terminal.

```sh
jupyter-lab
```

This command will start a JupyterLab server and open a new tab in your web browser.


## Step 5. Find the lab notebook you downloaded

On the web browser that runs JupyterLab, use the file browser on the left to navigate to the folder where you saved the lab notebook.
Double-click the notebook to open it and you can now run it.

If you are not familiar with Jupyter notebook, I recommend that you first watch
[this video (starting at 1:46)](https://youtu.be/A5YyoCKxEOU?t=106)
to learn a bit more about the Jupyter notebook interface.
