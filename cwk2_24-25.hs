import Data.Fixed (E0)
import Distribution.SPDX (LicenseId(MPL_2_0))
type Horse = [String]

horse :: Horse
horse =[ "   ,//)     ",
         "   ;;' \\   ",
         ",;;' ( '\\  ",
         "    / '\\-)"]

-- A number Horse, making test and verification easier.
numberHorse :: Horse
numberHorse = ["123",
               "456",
               "789"]

-- Rotate the Horse by 90 degree to the right
-- Process the Horse row by row.
transpose :: Horse -> Horse
transpose = foldl transposeHorse (repeat []) 

-- Helper function for transpose. 
-- Take a row of the Horse at a time. Add each of the character in the row to \
-- the front of rows in the transposed Horse.
transposeHorse :: Horse -> String -> Horse
transposeHorse transposed sourse = zipWith (:) sourse transposed

-- Flip the Horse on its verticle axis
mirror :: Horse -> Horse
mirror = map reverse

rotate180 :: Horse -> Horse
rotate180 = transpose . transpose

rotate270 :: Horse -> Horse
rotate270 = transpose . transpose . transpose

tribCons :: Int -> [Int] -> [Int]
tribCons 0 xs = xs
tribCons n (a:b:c:xs) = tribCons (n-1) ((a+b+c):a:b:c:xs)

tribonacci :: Int -> [Int]
tribonacci 0 = []
tribonacci 1 = [0] 
tribonacci 2 = [0,0] 
tribonacci 3 = [0,0,1]
tribonacci n = reverse $ tribCons (n-3) [1,0,0]

lcs :: Int -> [Int]
lcs n = map (\x -> (x*x + x + 2) `div` 2) [0..n]

-- To visualize the Horse as an image of horse.
pretty :: Horse -> IO()
pretty [h]    = do
                putStrLn h
pretty (h:hs) = do
                    putStrLn h
                    pretty hs
