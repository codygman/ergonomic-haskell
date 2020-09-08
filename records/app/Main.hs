module Main where

import Lib
import Optics
import Optics.TH

data Person = Person {name :: String, age :: Int}

makeFieldLabelsWith noPrefixFieldLabels ''Person

data Dog = Dog {name :: String, age :: Int}

makeFieldLabelsWith noPrefixFieldLabels ''Dog

data CatBall = CatBall {name :: String, ballType :: String}

makeFieldLabelsWith noPrefixFieldLabels ''CatBall

data Cat = Cat {name :: String, age :: Int, favoriteBall :: CatBall}

makeFieldLabelsWith noPrefixFieldLabels ''Cat

main :: IO ()
main =
  let person = Person "codygman" 1000
      dog = Dog "doggo" 5
      cat = Cat "doggo" 5 (CatBall "doggos" "tennis ball")
   in do
        if person ^. #name == "codygman"
          then do
            putStrLn $ "Good day, " ++ person ^. #name
            putStrLn $ "Your dog's name: " ++ dog ^. #name
            putStrLn $ "Your cat's name: " ++ cat ^. #name
            if cat ^. #favoriteBall % #name == "doggos"
              then do
                putStrLn "One second.. there's been a mix up it seems!"
                let fixedCat =
                      cat & #favoriteBall % #name .~ "cattos"
                          & #favoriteBall % #ballType .~ "yarn ball"
                putStrLn $ "Your cat's favorite ball type: " ++ fixedCat ^. #name
              else putStrLn $ "Your cat's name: " ++ cat ^. #name
          else pure ()
