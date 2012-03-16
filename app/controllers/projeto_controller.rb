class ProjetoController < ApplicationController

  def list
    @list = Projeto.all
  end

end
