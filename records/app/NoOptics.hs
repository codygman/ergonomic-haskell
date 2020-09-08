module NoOpticsMain where

data Person = Person {personName :: String, personAge :: Int}

data Dog = Dog {dogName :: String, dogAge :: Int}

data CatBall = CatBall {catBallName :: String, catBallType :: String}

data Cat = Cat {catName :: String, catAge :: Int, favoriteBall :: CatBall}

main :: IO ()
main =
  let person = Person "codygman" 1000
      dog = Dog "doggo" 5
      cat = Cat "doggo" 5 (CatBall "doggos" "tennis ball")
   in if personName person == "codygman"
        then do
          putStrLn $ "Good day, " ++ personName person
          putStrLn $ "Your dog's name: " ++ dogName dog
          putStrLn $ "Your cat's name: " ++ catName cat
          if (catBallName . favoriteBall $ cat) == "doggos"
            then do
              putStrLn "One second.. there's been a mix up it seems!"
              let fixedCat = cat {favoriteBall = (favoriteBall cat) {catBallName = "cattos", catBallType = "yarn ball"}}
              putStrLn $ "Your cat's favorite ball type: " ++ (catBallType . favoriteBall $ fixedCat)
            else putStrLn $ "Your cat's name: " ++ catName cat
        else pure ()
