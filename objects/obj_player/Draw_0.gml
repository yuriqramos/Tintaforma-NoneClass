///@description Desenhando o debug

// Desenha o próprio jogador
draw_self();

// Se debug estiver ativo
if(global.debug)
{
    // Desenha o Y do jogador
    draw_text(x, y - 30, string(y));
}