## B. Correlation and Independence

1. Use the function from Lab 1C (you can use the one you wrote or one from the extra material) to generate 1,000 random points on a 2D unit sphere.

2. Check whether the $x$ and $y$ coordinates of these points are coorelated.

3. Check whether the $x$ and $y$ coordinates of these points are independent.


## Hints B. Correlation and Independence

:::{dropdown} Hints for Step 1
Using the first method from Lab 1C, extra materials, we have:
```python
import numpy as np

def sphere_surface_rvs_method1(size=None):
    rng = np.random.default_rng()
    phi = rng.random(size=size) * 2 * np.pi
    z = rng.random(size=size) * 2 - 1
    s = np.sqrt(1 - z * z)
    x = s * np.cos(phi)
    y = s * np.sin(phi)
    return np.atleast_2d(np.stack([x, y, z]))

x, y, z = sphere_surface_rvs_method1(size=1000)
```
:::

:::{dropdown} Hints for Step 2
You can use [`scipy.stats.pearsonr`](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.pearsonr.html)
to calculate the correlation coefficient.
:::

:::{dropdown} Hints for Step 3
How would you check for independence between two samples?
Recall that the definition of independence of two random variables can also be written as
$\text{Pr}(A) = \text{Pr}(A|B=b), \forall b$.

Based on this definition, can you make a scatter plot or some histograms to check for whether $x$ and $y$ are independent?
:::
