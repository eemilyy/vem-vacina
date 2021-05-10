class EnderecosController < ApplicationController
    before_action :require_logged_in
    before_action :set_endereco, only: %i[ show edit ]

    def new
        @endereco = Endereco.new
    end


    def create
        @endereco = Endereco.new(endereco_params)
        @endereco.usuario_id = current_usuario.id

        if @endereco.save
            flash[:success] = "Cadastrado com sucesso"
            redirect_to usuario_path(current_usuario)
        else
            render 'root'
        end
    end

    def edit
    end

    private
        def set_endereco
            @endereco = current_usuario.endereco
        end

        def endereco_params
            params.require(:endereco).permit(:cep, :cidade, :bairro, :logradouro, :complemento)
        end
end
