task :default => :piedra

desc 'Execute the game, throw rock'
task :piedra do
  sh "ruby piedrapapeltijera.rb piedra"
end

desc 'Execute the game, throw paper'
task :papel do
  sh "ruby piedrapapeltijera.rb papel"
end

desc 'Execute the game, throw scissor'
task :tijera do
  sh "ruby piedrapapeltijera.rb tijera"
end

desc 'execute all tests games'
task :test do
  sh "rspec rspec.rb"
end


