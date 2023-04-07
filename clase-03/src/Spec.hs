module Spec where
import PdePreludat
import Library
import Test.Hspec

ochoAzul = implementame
ochoRojo = implementame
sieteAzul = implementame
sieteVerde = implementame


correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 3" $ do
    focus $ describe "Cartas con numero y color" $ do
      it "una carta se puede jugar despues de otra si coinciden sus numeros" $ do
        sePuedeJugar ochoAzul ochoRojo `shouldBe` True
      it "una carta no se puede jugar despues de otra si no coinciden sus numeros ni sus colores" $ do
        sePuedeJugar ochoAzul sieteVerde `shouldBe` False
      it "una carta se puede jugar despues de otra si coinciden sus colores" $ do
        sePuedeJugar ochoAzul sieteAzul `shouldBe` True
    describe "Jugadores" $ do
      let tomi = implementame -- tomi se llama "Tomas" y tiene 10 puntos
          emi = implementame -- emi se llama "Emiliano" y tiene 12 puntos
          manu = implementame -- manu se llama "Manuel" y tiene 10 puntos
      it "nombre me devuelve el nombre de un jugador" $ do
        nombre tomi `shouldBe` "Tomas"
      it "puntos me devuelve los puntos de un jugador" $ do
        puntos emi `shouldBe` 12
      -- Descomentar los tests una vez hayan implementado a
      -- tomi, emi y manu:
      -- describe "quienTieneMasPuntos" $ do
      --   it "dados un jugador con mas puntos y otro con menos, me devuelve el que tiene mas" $ do
      --     quienTieneMasPuntos emi tomi `shouldBe` emi
      --   it "dados un jugador con menos puntos y otro con mas, me devuelve el que tiene mas" $ do
      --     quienTieneMasPuntos tomi emi `shouldBe` emi
      --   it "dados dos jugadores con la misma cantidad de puntos, me devuelve el primero" $ do
      --     quienTieneMasPuntos tomi manu `shouldBe` tomi
      --     quienTieneMasPuntos manu tomi `shouldBe` manu
      describe "trasJugarPartida" $ do
        let partidaGanada = implementame
            partidaPerdida = implementame
            partidaEmpatada = implementame
        it "dado un jugador y una partida ganada, aumenta en 3 los puntos del jugador" $ do
          puntos (trasJugarPartida tomi partidaGanada) `shouldBe` 13
        it "dado un jugador y una partida perdida, deja al jugador con los mismos puntos que tenia" $ do
          puntos (trasJugarPartida tomi partidaPerdida) `shouldBe` 10
        it "dado un jugador y una partida empatada, aumenta en 1 los puntos del jugador" $ do
          puntos (trasJugarPartida tomi partidaPerdida) `shouldBe` 11
    describe "Cartas de mas 4" $ do
      let mas4Rojo = implementame
      it "siempre se puede jugar una carta de mas 4 por sobre otra carta" $ do
        sePuedeJugar sieteAzul mas4Rojo `shouldBe` True
      it "no puedo jugar una carta sobre un mas 4 si es de diferente color que el mas 4" $ do
        sePuedeJugar mas4Rojo sieteAzul `shouldBe` False
