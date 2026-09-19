///@description Configurações iniciais

#region Variáveis

// Variáveis de movimento
velh     = 0;   // Velocidade horizontal
velh_max = 1;   // Vel horizontal máxima

// Variáveis de input
right = noone;
left  = noone;
jump  = noone;

#endregion

#region Métodos

// Método de movimentação
movimento = function ()
{
    // Pegando os inputs
    var _right = keyboard_check(vk_right);  // Direita
    var _left  = keyboard_check(vk_left);   // Esquerda
    
    // Aplicando os inputs na velh
    velh = (_right - _left) * velh_max;
    
    // Aplicando a velocidade no eixo x
    x += velh;
}
#endregion