module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Test de ejemplo" $ do
    it "El pdepreludat se instaló correctamente" $ do
      doble 1 `shouldBe` 2
  describe "Perimetro de un circulo" $ do
    it "es 2 por pi por el radio del circulo" $ do
      perimetroCirculo 1 `shouldBe` 6.283185307
  describe "Cuadrados" $ do
    it "su perimetro es su lado por 4" $ do
      perimetroCuadrado 2 `shouldBe` 8
    it "su superficie es su lado al cuadrado" $ do
      superficieCuadrado 3 `shouldBe` 9
  describe "Cubos" $ do
    it "su superficie es la suma de las superficies de sus caras" $ do
      superficieCubo 1 `shouldBe` 6
      superficieCubo 2 `shouldBe` 24
  describe "Cilindros" $ do
    it "su superficie la superficie del tubo + la superficie de las 2 tapas" $ do
      superficieCilindro 1 2 `shouldBe` 18.849555922
  describe "Circulos" $ do
    it "su superficie pi por radio al cuadrado" $ do
      superficieCirculo 1 `shouldBe` pi
      superficieCirculo 2 `shouldBe` 12.566370614
