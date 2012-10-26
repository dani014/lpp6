require "./piedrapapeltijera"


describe PiedraPapelTijera do

   before :each do
      @ppt=PiedraPapelTijera.new([:piedra, :papel, :tijera])
   end

   it "Debe existir una tirada para el humano" do
      @ppt.respond_to?("humano_tira").should == true
   end

   it "Debe existir una tirada para la maquina" do
      @ppt.respond_to?("maquina_tira").should == true
   end

   it "Debe existir una lista de tiradas validas y quien gana" do
      @ppt.tiradas.should == [:piedra, :papel, :tijera]
   end

   it "Se debe invocar al metodo obtener_humano() para recoger la tirada del humano y que esta sea valida" do
      @ppt.tiradas.include? @ppt.obtener_humano
   end

   it "Se debe invocar al metodo obtener_maquina() para recoger la tirada de la maquina y que esta sea valida" do
      @ppt.tiradas.include? @ppt.obtener_maquina
   end

   it "Debe existir una lista de resultados de un juego desde el punto de vista de la maquina" do
      @ppt.resultados.should == [:empate, :ganas, :pierdes]

   end

   it "Se debe invocar al metodo jugar() para determinar el ganador de la tirada" do
      @ppt.resultados.include? @ppt.jugar
   end

   it "Se debe de comprobar que las tiradas de la maquina al ser aleatorias recorren las tres posibilidades" do
      comprueba_maquina = []
      50.times do
         comprueba_maquina.push @ppt.obtener_maquina
      end
      comprueba_maquina.uniq.length.should == @ppt.tiradas.length
   end

   it "Se debe comprobar que las tiradas de la maquina y del humano no son siempre la misma" do
      comprueba_humano = []
      comprueba_maquina = []
      50.times do
         comprueba_humano.push @ppt.tiradas.sample
         comprueba_maquina.push @ppt.obtener_maquina
      end
      (((comprueba_humano.uniq.length.should) and (comprueba_maquina.uniq.length.should)) == @ppt.tiradas.length)
    end
end
