int a[16][16], b[16][16], c[16][16];

int main()
{
	int i, j, k;

	for (i = 0; i < 16; i++)
		for (j = 0; j < 16; j++)
			a[i][j] = b[i][j] = 1;

	for (i = 0; i < 16; i++)
	{
		for (j = 0; j < 16; j++)
		{
			c[i][j] = 0;
			for (k = 0; k < 16; k++)
			{
				c[i][j] = c[i][j] + a[i][k] * b[k][j];
			}
		}
	}

	asm volatile("csrwi 0x780, 1");
	asm volatile("ecall");
}