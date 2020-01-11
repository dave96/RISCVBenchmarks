int a[128];
int sum = 0;

int main()
{
	int i;
	for (i = 0; i < 128; i++)
		a[i] = 1;

	for (i = 0; i < 128; i++)
		sum += a[i];

	asm volatile("csrwi 0x780, 1");
	asm volatile("ecall");
}