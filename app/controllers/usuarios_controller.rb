class UsuariosController < ApplicationController
    before_action :require_logged_in, only:[:edit, :update]

    def new
        @usuario = Usuario.new
    end

    def show
    end

    def create
        @usuario = Usuario.new(usuario_params)

        if @usuario.save
            flash[:success] = "Cadastrado com Sucesso"
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if current_usuario.update(usuario_params)
            flash[:success] = "Dados atualizados"
            redirect_to vacinas_path
        else
            render 'edit'
        end
    end

    private
        def usuario_params
            params.require(:usuario).permit(:nome_completo, :data_nascimento, :nome_mae, :cpf, :telefone, :email, :password, :password_confirmation)
        end
end
