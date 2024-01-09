# Hints for Lab 1: Sampling Random Variables

*For the class on Wednesday, January 10th*

:::{seealso}
Go back to [Lab 1](01)
:::

## A. Inverse transform sampling

:::{dropdown} Hints for Step 1
- What is the inverse function of the CDF of an exponential distribution? This is known as the inverse cumulative distribution function, also known as the quantile function. You can find it on [Wikipedia](https://en.wikipedia.org/wiki/Exponential_distribution).
- The inverse transform sampling method says that applying the inverse CDF of a random variable $X$ on a stanfard uniform random variable $U \sim \text{Unif}(0,1)$ gives you the random variable $X$.
- Here's a snippet to get you started with the code structure:
    ```python
    def exponential_rvs(l=1, size=None):
        # here l is the parameter lambda
        rng = np.random.default_rng()
        uniform_rvs = rng.random(size)
        # Put your implementation for Part A, Step 1 here!
    ```
:::

:::{dropdown} Hints for Step 2
- To make a two-sample quantile-quantile plot, you will first need to calculate a given set of quantiles on each sample.
    Here's a function that calculate the quantiles for two samples.
    ```python
    def qqplot_data(x, y):
        n = min(len(x), len(y))
        q = (np.arange(n) + 0.5) / n
        qx = np.quantile(x, q)
        qy = np.quantile(y, q)
        return qx, qy
    ```
- Then, you will need to make a scatter plot between the calculated quantiles from the two samples.
  You will also need to add a $y=x$ line to your plot to guide your eye.
  You can then try to interpret the q-q plot you make!
:::

## B. Rejection sampling

:::{dropdown} Hints for Step 1
- The circle is fully enclosed within the square whose vertices are (1,1), (-1,1), (-1,-1), and (1,-1).
  Can you generate points that are sampled uniformly at random within this square using the built-in standard uniform random number generator?
- Then, you can check whether each point that you generate is within the circle. Reject the ones that are not.
- Here's a snippet to get you started with the code structure:
    ```python
    def uniform_rvs_in_circle(size=None):
        rng = np.random.default_rng()

        # Here we are using np.ravel to make sure we get a 1D array
        x = np.ravel(rng.random(size=size))
        y = np.ravel(rng.random(size=size))

        # Now x, y are both between 0 and 1.
        # How do you translate that to be within the square of (1,1), (-1,1), (-1,-1), and (1,-1)?
        # Add your implementation here!

        # Then, check if the points are within the circle:
        mask_within = # Add your implementation here!

        # Finally, let's return the points that are within the circle
        return x[mask_within], y[mask_within]
    ```
:::

:::{dropdown} Hints for Step 2
- Note that you 1,000 points in the circle! If you generate 1,000 points in the square, how many will be left after the rejection method?
:::

:::{dropdown} Hints for Step 3
- If you think in the polar coordinates, what would you expect the distributions of $r$ and $\theta$
  to be if the points are sampled uniformly at random within the circle?
:::

## C. Sampling random rotations


