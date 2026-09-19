///@description Configurações iniciais

#region Variáveis

// Variáveis de movimento
velh     = 0;   // Velocidade horizontal
velh_max = 1;   // Vel horizontal máxima

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
    
    // Usando o move and collide
    move_and_collide(velh, 0, obj_colisao, 4);
}
#endregion