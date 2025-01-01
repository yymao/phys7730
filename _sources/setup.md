# Set up Python environment

You will need a working Python environment to run the examples and to complete the labs in this course.

I choose Python as the main language for this course because Python is a widely used language for data science.
Many common algorithms, including ones used in this course, are readily available as Python packages,
and resources for Python and Python packages are easy to find.
If you wish to use a different programming language, please read [](sec:other-languages) below.

If you already have a working Python environment, it may already be sufficient for this course.
However, I strongly recommend that you still [create a new environment](sec:new-environment)
so that the Python packages you used in this course will not interfere with your original environment.
The instructions below will guide you to install conda (if needed) and create a new Python environment.

## Use Python on your machine

First, check if you already have `conda` available on your machine.
If you have been using Python on your machine, there is a good chance that you already have `conda` too.
You can check whether the `conda` command is available from a terminal.
If it is, skip [](sec:install-conda) and jump to [](sec:new-environment) directly.

(sec:install-conda)=
### Install conda

```{margin}
Miniforge and Miniconda differ in the channel used to fetch the packages.
Miniforge uses the [conda-forge](https://conda-forge.org/) channel, which has a more comprehensive list of packages and is usually more up-to-date as well.
Anaconda comes with a large selection of pre-install packages, many of which we will not use in this course. But if disk space is not a concern you can choose Anaconda too.
```

If `conda` is not available on your machine, you can install one very easily.

I recommend installing [Miniforge](https://github.com/conda-forge/miniforge/blob/main/README.md), but you can choose [Miniconda](https://docs.conda.io/projects/miniconda/en/latest/) or even [Anaconda](https://www.anaconda.com/download) if you like.

Simply download Miniforge3 for your OS [from this page](https://github.com/conda-forge/miniforge/blob/main/README.md#miniforge3).
Once it's downloaded, just run the installer and follow the instruction therein.

Near the end of the installation process, you will be prompted to choose whether you want the base conda environment be activated by default.
If you choose no, make sure you copy the command that activates the base conda environment and keep it somewhere handy.
You will need to activate the base conda environment for the `conda` command to be available on your machine.

(sec:new-environment)=
### Create a new environment
Once `conda` is available on your machine, you can go ahead and create a new environment for this course.

First, download [this environment definition file](https://yymao.github.io/phys7730/environment.yml).

Once it's downloaded, you can run:

```sh
conda env create -f /path/to/environment.yml
```

Once the package installation is done, you can run the following to activate this new environment:
```sh
conda activate 7730
```

### Start JupyterLab

After the `7730` environment is activated, you can start the JupyterLab interface by running
```sh
jupyter lab
```


## Use Python on Google Colab

If you don't want to install Python on your own machine, or if you don't have access to a machine that you can install new software,
you can use [Google Colab](https://colab.google/) as an alternative.

Google Colab provides free Jupyter Notebook service.
To use Google Colab, you will need a Google account, a web browser, and a stable Internet connection.
Simply visit https://colab.research.google.com/ to start using the service.

Google Colab already has all the packages that we will use in this course installed,
except for `corner` and `emcee`.
When you run labs that use `corner` or `emcee`, please run the follow line in your
Google Colab notebook:

```
%pip install corner emcee
```

(sec:other-languages)=
## Use other programming languages

While I strongly recommend using Python for this course, learning Python is *not* one of the [learning objectives](sec:learning-objectives) of this course.
Hence, if using another programming language makes it easier for you to learn the materials in this course,
you are welcome to do so. You can submit the assignments using the programming language you choose.

You will be responsible to translate the provided labs to the language of your choice.
Please note that I will not be able to assist the translation, nor can I help you identify packages in other programming languages that offer the functionalities of Python packages that we use.
