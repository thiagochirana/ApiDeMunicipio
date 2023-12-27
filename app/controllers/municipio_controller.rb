class MunicipioController < ApplicationController

  def por_estado
    sigla_r = params[:sigla]
    puts 'VOU REQUISITAR MUNICIPIOS DO ESTADO ' + sigla_r
    estado = Estado.find_by(sigla: sigla_r.upcase)  
    municipios = estado.municipios if estado
    render json: municipios
  end
end
