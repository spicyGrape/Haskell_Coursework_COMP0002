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
transpose= transposeHorse (repeat [])

transposeH :: Horse -> Horse
transposeH = foldl transposeHorseH (repeat []) 

transposeHorse :: Horse -> Horse -> Horse
transposeHorse h [] = h
transposeHorse transposed (sourse:sourses) = transposeHorse (zipWith (:) sourse transposed) sourses

transposeHorseH :: Horse -> String -> Horse
transposeHorseH transposed sourse = zipWith (:) sourse transposed

pretty :: Horse -> IO()
pretty [h]    = do
                putStrLn h
pretty (h:hs) = do
                    putStrLn h
                    pretty hs
