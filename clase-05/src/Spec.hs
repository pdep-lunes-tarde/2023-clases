module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 5" $ do
    describe "Test de ejemplo" $ do
      it "Dos y dos son cuatro" $
        2 + 2 `shouldBe` 4