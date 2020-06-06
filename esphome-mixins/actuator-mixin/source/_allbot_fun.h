
void bot_move(char servo[], int angle)
{
    id(knee_rear_right).write(angle / 90.0);
}

void bot_animate(int speedms)
{
    delay(speedms);
}
