module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
    it "un año divisible por 400 siempre es bisiesto" $ do
        esBisiesto 2000 `shouldBe` True
    it "un año divisible por 4 pero no por 100 es bisiesto" $ do
        esBisiesto 2004 `shouldBe` True
    it "un año divisible por 4 y por 100 pero no por 400 no es bisiesto" $ do
        esBisiesto 2100 `shouldBe` False
