type Horse = [String]

horse :: Horse
horse =[ "   ,//)     ",
         "   ;;' \\   ",
         ",;;' ( '\\  ",
         "    / '\\-)"]

numberHorse :: Horse
numberHorse = ["123",
               "456",
               "789"]

transpose :: Horse -> Horse
transpose = foldl transposeHorse (repeat []) 

transposeHorse :: Horse -> String -> Horse
transposeHorse transposed sourse = zipWith (:) sourse transposed

pretty :: Horse -> IO()
pretty [h]    = do
                putStrLn h
pretty (h:hs) = do
                    putStrLn h
                    pretty hs
