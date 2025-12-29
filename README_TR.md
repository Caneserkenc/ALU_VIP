# ALU Doğrulama IP (VIP) Projesi

## Genel Bakış
Bu proje, bir Aritmetik Mantık Birimi (ALU) için SystemVerilog ve Evrensel Doğrulama Metodolojisi (UVM) kullanılarak bir Doğrulama IP'si (VIP) uygular. ALU tasarımı, [FPGA4Student](https://www.fpga4student.com/2017/06/Verilog-code-for-ALU.html) tarafından sağlanan Verilog uygulamasına dayanmaktadır. VIP, ALU'nun çeşitli senaryolarda işlevselliğini doğrulamak ve doğruluğunu sağlamak için tasarlanmıştır.

## ALU İşlevselliği
ALU, 4 bitlik bir seçim girişi (`ALU_Sel`) temelinde aşağıdaki işlemleri gerçekleştirir:

| `ALU_Sel` | İşlem                          |
|-----------|--------------------------------|
| 0000      | Toplama (`A + B`)             |
| 0001      | Çıkarma (`A - B`)             |
| 0010      | Çarpma (`A * B`)              |
| 0011      | Bölme (`A / B`)               |
| 0100      | Mantıksal sola kaydırma (`A << 1`)|
| 0101      | Mantıksal sağa kaydırma (`A >> 1`)|
| 0110      | Sola döndürme                 |
| 0111      | Sağa döndürme                 |
| 1000      | Mantıksal VE (`A & B`)        |
| 1001      | Mantıksal VEYA (`A | B`)      |
| 1010      | Mantıksal XOR (`A ^ B`)       |
| 1011      | Mantıksal NOR (`~(A | B)`)    |
| 1100      | Mantıksal NAND (`~(A & B)`)   |
| 1101      | Mantıksal XNOR (`~(A ^ B)`)   |
| 1110      | Büyüktür karşılaştırması (`A > B`)|
| 1111      | Eşitlik karşılaştırması (`A == B`)|

## Proje Yapısı
Proje aşağıdaki gibi organize edilmiştir:

```
ALU_VIP3/
├── agent/
│   ├── alu_agent.svh       # ALU için UVM agent
│   ├── alu_driver.svh      # UVM sürücüsü
│   ├── alu_if.sv           # ALU arayüzü
│   ├── alu_monitor.svh     # UVM monitörü
│   └── alu_seq_item.svh    # Sıra öğesi
├── env/
│   └── alu_env.svh         # UVM ortamı
├── package/
│   └── alu_pkg.sv          # ALU paketi
├── rtl/
│   └── alu.v               # ALU RTL tasarımı
├── scoreboard/
│   └── alu_scoreboard.svh  # UVM skor tahtası
├── scripts/
│   ├── debug.f             # Hata ayıklama betiği
│   └── run.f               # Çalıştırma betiği
├── sequence/
│   └── alu_base_sequence.svh # Temel sıra
├── sim/
│   ├── dsim.env            # Simülasyon ortamı
│   ├── waves.mxd           # Dalgaformu yapılandırması
│   └── dsim_work/          # Simülasyon çalışma dizini
├── test/
│   └── alu_test.svh        # Testbench
└── testbench/
    └── tb_top.sv           # Üst düzey testbench
```

## Nasıl Çalıştırılır
1. **Ortamı ayarlayın:**
   - DSim simülatörünün kurulu olduğundan emin olun.
   - Gerekli DSim çalıştırılabilir dosyalarını PATH'e ekleyin.

2. **Tasarımı ve testbench'i derleyin:**
   - `scripts/run.f` dosyasını kullanarak DSim ile derleme yapın:
   ```bash
   dsim -f scripts/run.f
   ```

3. **Simülasyonu çalıştırın:**
   - Derleme tamamlandıktan sonra simülasyonu başlatın:
   ```bash
   dsim tb_top
   ```

4. **Dalgaformunu görüntüleyin:**
   - Simülasyon sırasında oluşturulan dalgaformu dosyasını açın. Örneğin:
   ```bash
   dsim -view waves.mxd
   ```

## Referanslar
- [FPGA4Student: Verilog code for ALU](https://www.fpga4student.com/2017/06/Verilog-code-for-ALU.html)
- [UVM Methodology](https://www.accellera.org/downloads/standards/uvm)
- [DSİM](https://altair.com/dsim)

## Lisans
Bu proje yalnızca eğitim amaçlıdır. ALU tasarımı [FPGA4Student](https://www.fpga4student.com/) kaynağından alınmıştır.