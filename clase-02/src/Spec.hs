module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "preguntar" $ do
    it "si le paso una oracion que ya tiene signos de pregunta, la deja igual" $ do
      preguntar "¿como estas?" `shouldBe` "¿como estas?"
      preguntar "¿todo bien?" `shouldBe` "¿todo bien?"
    it "si le paso una oracion que le falta el signo de pregunta que cierra, se lo agrega" $ do
      preguntar "¿como estas" `shouldBe` "¿como estas?"
      preguntar "¿hay alguien" `shouldBe` "¿hay alguien?"
    it "si le paso una oracion que le falta el signo de pregunta que abre, se lo agrega" $ do
      preguntar "como estas?" `shouldBe` "¿como estas?"
      preguntar "todo bien?" `shouldBe` "¿todo bien?"
    it "si le paso una oracion sin ningun signo de pregunta, agrega ambos" $ do
      preguntar "hola" `shouldBe` "¿hola?"

