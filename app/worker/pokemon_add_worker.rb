class PokemonAddWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  require 'csv'
  def perform(csv_path)
    CSV.foreach((csv_path), headers: true) do |pokemon|
      Pokemon.create(
        pokedex_id: pokemon[0].to_i,
        name: pokemon[1],
        height: pokemon[3],
        weight: pokemon[4]
      )
    end
  end
end