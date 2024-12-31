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

-- To visualize the Horse as an image of horse.
pretty :: Horse -> IO()
pretty [h]    = do
                putStrLn h
pretty (h:hs) = do
                    putStrLn h
                    pretty hs
