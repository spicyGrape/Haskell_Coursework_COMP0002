type Horse = [String]

horse :: Horse
horse =[ "   ,//)    ",
         "   ;;' \\   ",
         ",;;' ( '\\  ",
         "    / '\\-) "]

-- A number Horse, making test and verification easier.
numberHorse :: Horse
numberHorse = ["123",
               "456",
               "789"]

-- Rotate the Horse by 90 degree to the right
-- Although it is actually rotating the Horse, it is called transpose, as \
-- required by the coursework specification.
-- Process the source Horse row by row. Construct the new Horse column by column
transpose :: Horse -> Horse
transpose = foldl transposeHorse (repeat []) 

-- Helper function for transpose. 
-- Take a row of the Horse at a time. Add each of the character in the row to \
-- the first column in the transposed Horse.
transposeHorse :: Horse -> String -> Horse
transposeHorse transposed sourse = zipWith (:) sourse transposed

-- Flip the Horse on its verticle axis
mirror :: Horse -> Horse
mirror = map reverse

rotate180 :: Horse -> Horse
rotate180 = transpose . transpose

rotate270 :: Horse -> Horse
rotate270 = transpose . transpose . transpose

-- Helper function for tribonacci. Constructing the tribonacci sequence in the \
-- reversed order.
tribCons :: Int -> [Int] -> [Int]
tribCons 0 xs = xs
tribCons n (a:b:c:xs) = tribCons (n-1) ((a+b+c):a:b:c:xs)

-- Generate tribonacci sequence to the n th term.
tribonacci :: Int -> [Int]
tribonacci 0 = []
tribonacci 1 = [0] 
tribonacci 2 = [0,0] 
tribonacci 3 = [0,0,1]
tribonacci n = reverse $ tribCons (n-3) [1,0,0]

-- Generate the LC sequence. Starting from 0th term, to n th term.
lcs :: Int -> [Int]
lcs n = map (\x -> (x*x + x + 2) `div` 2) [0..n]

-- To visualize the Horse as an image of horse.
pretty :: Horse -> IO()
pretty [h]    = do
                putStrLn h
pretty (h:hs) = do
                    putStrLn h
                    pretty hs

-- repeat the horse multiple times on the horizontal direction.
repeatHorse :: Horse -> Int -> Horse
repeatHorse h n = foldl (zipWith (++)) (map (const []) h) $ map (const h) [1..n]

horseSeq :: (Int -> [Int]) -> Int -> Horse -> IO()
horseSeq f n h = putHorseSeq (f n) h 
    where 
    putHorseSeq [x] h = do
                        pretty (repeatHorse h x)
    putHorseSeq (x:xs) h = do
                           pretty (repeatHorse h x)
                           putHorseSeq xs h

shead :: [a] -> Maybe a
shead [] = Nothing
shead (x:_) = Just x

stail :: [a] -> Maybe [a]
stail [] = Nothing
stail (_:xs) = Just xs

