long long a[128];
long long b[128];

int main() {
  int i;
  for(i = 0; i < 128; i++)
    a[i] = i*229238;
  for(i = 0; i < 128; i++)
    b[i] = a[i] / 23;

  asm volatile("csrwi 0x780, 1");
  asm volatile("ecall");
}
