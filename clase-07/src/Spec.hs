module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 7" $ do
    it "unos deberia ser todos 1s" $ do
      take 10 unos `shouldBe` [1,1,1,1,1,1,1,1,1,1]
    it "repetir deberia ser una lista con todos el elemento a repetir" $ do
      take 10 (repetir 1) `shouldBe` [1,1,1,1,1,1,1,1,1,1]
      take 3 (repetir "hola") `shouldBe` ["hola", "hola", "hola"]
    it "replicar deberia ser una lista con el elemento a repetir tantas veces como se pida" $ do
      replicar 10 1 `shouldBe` [1,1,1,1,1,1,1,1,1,1]
      replicar 3 "hola" `shouldBe` ["hola", "hola", "hola"]
    it "naturales deberia ser los enteros mayores a 0 en orden" $ do
      take 10 naturales `shouldBe` [1,2,3,4,5,6,7,8,9,10]
    it "losPares deberia ser los numeros pares en orden" $ do
      take 10 losNaturalesPares `shouldBe` [2,4,6,8,10,12,14,16,18,20]
    it "serieDeFibonacci deberia ser los numeros de la serie de fibonacci" $ do
      take 10 serieDeFibonacci `shouldBe` [0,1,1,2,3,5,8,13,21,34]