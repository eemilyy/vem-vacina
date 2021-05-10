class UsuariosController < ApplicationController

    def new
        @usuario = Usuario.new
    end

    def create
    end
end
