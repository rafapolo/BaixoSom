class PessoaController < ApplicationController

  def index
    @pessoa = Pessoa.find(params[:id])
  end
  
end
