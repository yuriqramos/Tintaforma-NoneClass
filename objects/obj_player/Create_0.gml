///@description Configurações iniciais

#region Variáveis

// Variáveis de movimento
velh     = 0;     // Velocidade horizontal
velh_max = 1;     // Vel horizontal máxima
velv     = 0;     // Velocidade vertical
velv_max = 4;     // Vel vertical máxima
grav     = 0.2;   // Gravidade

// Variáveis de level
chao = false;

// Variáveis de inputs
right = 0;   // Direita
left  = 0;   // Esquerda
jump  = 0;   // Pulo

#endregion

#region Métodos

// Método para pegar inputs
inputs_pega = function()
{
    // Inputs
    right = keyboard_check(vk_right);   // Seta direita
    left  = keyboard_check(vk_left);    // Seta esquerda
    space = keyboard_check(vk_space);   // Espaço
}

// Método de movimentação
movimento = function()
{
    // Aplicando os inputs na velh
    velh = (right - left) * velh_max;
    
    // Se chão for falso
    if(!chao)   
    {
        // Aplica a gravidade na vel vertical
        velv += grav;
    }
    else
    {
        // Zera a vel vertical para não acumular vel horizontal
        velv = 0;
    }
    
    // Usando o move and collide horizontal
    move_and_collide(velh, 0, obj_colisao, 24);
    
    // Usando o move and collide vertical
    move_and_collide(0, velv, obj_colisao, 24);
}

// Checa se estão tocando no chão
chao_checa = function()
{
    chao = place_meeting(x, y + 1, obj_colisao);
}
#endregion