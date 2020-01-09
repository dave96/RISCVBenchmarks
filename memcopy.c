int a[128];
int b[128];

int main() {
  int i;
  for(i = 0; i < 128; i++)
    a[i] = 5;
  for(i = 0; i < 128; i++)
    b[i] = a[i];

  asm volatile("mret");
}
