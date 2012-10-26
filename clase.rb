class PiedraPapelTijera

   attr_reader :humano_tira, :maquina_tira, :tiradas, :tirada_ganadora, :resultados

   def initialize(tirada)
        @humano = tirada
        @tiradas = [:piedra, :papel, :tijera]
        @tirada_ganadora = {:piedra => :tijera, :papel => :piedra, :tijera => :papel}
        @resultados = [:empate, :ganas, :pierdes]
        puts("Resultado:")
        if jugar() == :empate
           puts("Empate")
        elsif jugar() == :ganas
           puts("#{obtener_humano()} gana a #{@maquina}")
        else
           puts("#{@maquina} gana a #{obtener_humano()}")
        end
   end

   def obtener_humano()
        return @humano
   end

   def obtener_maquina()
        @maquina = @tiradas.sample
   end

   def jugar()
      if obtener_humano() == obtener_maquina()
         @resultado = :empate
      elsif obtener_humano() == @tirada_ganadora[@maquina]
        @resultado = :pierdes
     else
        @resultado = :ganas
     end

     return @resultado
   end

end
