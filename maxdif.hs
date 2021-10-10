import System.IO

maxDiff :: [Int] -> Int

-- max diff function
maxDiff = foldl max(-1)
    .filter(/=0)
    .(zipWith (-) <*> scanl1 min)

main = do
    let nums = [7,1,5,4]
    print (maxDiff nums)
