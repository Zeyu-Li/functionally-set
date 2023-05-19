# Functional Programming

### A bit about functional programming

Functional Programming as opposed to procedural programming is not based functions map from a set of inputs to some set of outputs. As you can see, this is a strict and rigorous mathematical way to program. To achieve this, FL (functional languages) makes variables immutable. This way you cannot modify anything. Then how do you do anything you may ask? Well, most FL can still copy one variable to the next. Therefore, if we want to modify some element in an array, just copy the array while defining the changed element to the new element.

With this much copying, you might assume that it is a slow language, however, FLs do this in a clever way. Say we have an array of 100 different elements. FLs usually creates multiple partitions (subsets) and organize it in a tree. Therefore, if we want to change something in the middle, copy and change a single sub-node of the tree containing the offending element.



### Example

Take the Leetcode problem [maximum difference between increasing elements](https://leetcode.com/problems/maximum-difference-between-increasing-elements/)

The procedural solution is something like the following in Python

```python
def main(nums):
    result = -1
    # equvilent to UINT_MAX in C++
    curr_min = sys.maxsize
    for num in nums:
        # replace current min if lower
        curr_min = min(num, curr_min)
        if num > curr_min:
            result = max(result, num - curr_min)
    
    return result

nums = [7,1,5,4]
main(nums)
```

Now let's look at the functional way

```haskell
import System.IO

maxDiff :: [Int] -> Int

-- max diff function
maxDiff = foldl max(-1)
    .filter(/=0)
    .(zipWith (-) <*> scanl1 min)

main = do
    let nums = [7,1,5,4]
    print (maxDiff nums)
```

As you can see, what can be done in 7 lines of Python can be done in 4 lines of Haskell. 

For the Haskell solution, the steps are

1. Min scan the array (ie [7,1,5,4] maps to [7,1,1,1])
2. Take the diff of the min scan and the original (this is done with the zip in haskell but look at the Scala solution for a clearer picture)
3. Filter out the 0s
4. Take max | -1 if the array is empty

Scala solution if the Haskell solution is not clear, which it still isn't for me 😳

```scala
nums.scanLeft(Int.MaxValue)(_ min _) 	// same scan left
	.tail								// removes the min since it was added in the scanLeft
	.zip(nums)							// zip result with nums
	.map(x => x._2 - x._1)				// map the tuples to get the diff (lambda func is just the diff)
	.filter(_ != 0)						// filters out 0
	.foldLeft(-1)(_ max _)				// returns max or -1
```



## Sources

Leetcode Problem: [leetcode.com/problems/maximum-difference-between-increasing-elements](https://leetcode.com/problems/maximum-difference-between-increasing-elements/)

Video inspiration: [YouTube: Functional vs Array Programming](https://www.youtube.com/watch?v=UogkQ67d0nY)

