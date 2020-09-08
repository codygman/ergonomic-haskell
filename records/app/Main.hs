module Main where

import Lib
import Optics
import Optics.TH

data Person = Person { personName :: String, personAge :: Int}

makeFields ''Person

data Dog = Dog {dogName :: String, dogAge :: Int}

makeFields ''Dog

data CatBall = CatBall {catBallName :: String, catBallType_ :: String}

makeFields ''CatBall

data Cat = Cat {catName :: String, catAge :: Int, catFavoriteBall :: CatBall}

makeFields ''Cat

main :: IO ()
main =
  let person = Person "codygman" 1000
      dog = Dog "doggo" 5
      cat = Cat "doggo" 5 (CatBall "doggos" "tennis ball")
   in do
        if person ^. name == "codygman"
          then do
            putStrLn $ "Good day, " ++ person ^. name
            putStrLn $ "Your dog's name: " ++ dog ^. name
            putStrLn $ "Your cat's name: " ++ cat ^. name
            if cat ^. favoriteBall % name == "doggos"
              then do
                putStrLn "One second.. there's been a mix up it seems!"
                let fixedCat =
                      cat & favoriteBall % name .~ "cattos"
                          & favoriteBall % type_ .~ "yarn ball"
                putStrLn $ "Your cat's favorite ball type: " ++ fixedCat ^. name
              else putStrLn $ "Your cat's name: " ++ cat ^. name
          else pure ()
