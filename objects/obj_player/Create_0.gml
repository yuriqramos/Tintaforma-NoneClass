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
    space = keyboard_check_pressed(vk_space);   // Espaço
}

// Método de movimentação
movimento = function()
{
    // Aplicando os inputs na velh
    velh = (right - left) * velh_max;
    
    // Aplicando gravidade
    if(!chao)
    {
        // Aplica a gravidade na vel vertical
        velv += grav;
    }
    else if(space)
    {
        // Aplica vel para pular
        velv += -velv_max;
    }
    else
    {
        // Zera a vel vertical para não acumular vel horizontal
        velv = 0;
        
        y = round(y);
    }
    
    show_debug_message(y);
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

#region Debug

// Método de debug
debug_roda = function()
{ 
    // Cria uma view para o debug
    view_player = dbg_view("View player 1", global.debug, 40, 40, 300, 400);
    
    // Mostra o debug overlay
    show_debug_overlay(1); 

    // Variáveis de debug
    dbg_watch(ref_create(self, "velv"), "Vel V");   // Velocidade vertical 
    
    // Sliders de debug
    dbg_slider(ref_create(id, "velv_max"), 0, 10, "Velv Max", 0.5);   // Velocidade máxima
    dbg_slider(ref_create(self, "grav"), 0, 1, "Gravidade", 0.01);    // Gravidade
}

// Método para ativaro debug
debug_ativa = function()
{
    // Se apertar o TAB
    if(keyboard_check_pressed(vk_tab))
    {
        // Inverte o valor de debug
        global.debug = !global.debug;
        
        // Se o debug estiver ativo
        if(global.debug)
        {
            // Roda o método de debug
            debug_roda();    
        }
        else 
        {
            // Desativa o debug overlay
            show_debug_overlay(0);
            
            // Se tiver criado a view
            if(dbg_view_exists(view_player))
            {
                // Deleta a view player
                dbg_view_delete(view_player);
            }
        }
    }
}

#endregion