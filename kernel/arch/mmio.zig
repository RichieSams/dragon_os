// zig fmt: off

pub const BASE: comptime_int = 0x107C000000;

const GIO_NUM_REGISTERS_PER_BANK: comptime_int = 8;
const GIO_BANK_SIZE: comptime_int              = GIO_NUM_REGISTERS_PER_BANK * @sizeOf(u32);

const GIO_BASE: comptime_int              = BASE + 0x1508500;
pub const GIO_BANK0_DATA: *volatile u32   = @ptrFromInt(GIO_BASE + (GIO_BANK_SIZE * 0) + 0x04);
pub const GIO_BANK0_IO_DIR: *volatile u32 = @ptrFromInt(GIO_BASE + (GIO_BANK_SIZE * 0) + 0x08);
pub const GIO_BANK1_DATA: *volatile u32   = @ptrFromInt(GIO_BASE + (GIO_BANK_SIZE * 1) + 0x04);
pub const GIO_BANK1_IO_DIR: *volatile u32 = @ptrFromInt(GIO_BASE + (GIO_BANK_SIZE * 1) + 0x08);

pub const GIO_BANK0_LINE_GPIO_000: comptime_int       = 1 <<  0;
pub const GIO_BANK0_LINE_GPIO_001: comptime_int       = 1 <<  1;
pub const GIO_BANK0_LINE_2712_BOOT_CS_N: comptime_int = 1 <<  1;
pub const GIO_BANK0_LINE_GPIO_002: comptime_int       = 1 <<  2;
pub const GIO_BANK0_LINE_2712_BOOT_MISO: comptime_int = 1 <<  2;
pub const GIO_BANK0_LINE_GPIO_003: comptime_int       = 1 <<  3;
pub const GIO_BANK0_LINE_2712_BOOT_MOSI: comptime_int = 1 <<  3;
pub const GIO_BANK0_LINE_GPIO_004: comptime_int       = 1 <<  4;
pub const GIO_BANK0_LINE_2712_BOOT_SCLK: comptime_int = 1 <<  4;
pub const GIO_BANK0_LINE_GPIO_005: comptime_int       = 1 <<  5;
pub const GIO_BANK0_LINE_GPIO_006: comptime_int       = 1 <<  6;
pub const GIO_BANK0_LINE_GPIO_007: comptime_int       = 1 <<  7;
pub const GIO_BANK0_LINE_GPIO_008: comptime_int       = 1 <<  8;
pub const GIO_BANK0_LINE_GPIO_009: comptime_int       = 1 <<  9;
pub const GIO_BANK0_LINE_GPIO_010: comptime_int       = 1 << 10;
pub const GIO_BANK0_LINE_GPIO_011: comptime_int       = 1 << 11;
pub const GIO_BANK0_LINE_GPIO_012: comptime_int       = 1 << 12;
pub const GIO_BANK0_LINE_GPIO_013: comptime_int       = 1 << 13;
pub const GIO_BANK0_LINE_GPIO_014: comptime_int       = 1 << 14;
pub const GIO_BANK0_LINE_PCIE_SDA: comptime_int       = 1 << 14;
pub const GIO_BANK0_LINE_GPIO_015: comptime_int       = 1 << 15;
pub const GIO_BANK0_LINE_PCIE_SCL: comptime_int       = 1 << 15;
pub const GIO_BANK0_LINE_GPIO_016: comptime_int       = 1 << 16;
pub const GIO_BANK0_LINE_GPIO_017: comptime_int       = 1 << 17;
pub const GIO_BANK0_LINE_GPIO_018: comptime_int       = 1 << 18;
pub const GIO_BANK0_LINE_GPIO_019: comptime_int       = 1 << 19;
pub const GIO_BANK0_LINE_GPIO_020: comptime_int       = 1 << 20;
pub const GIO_BANK0_LINE_PWR_GPIO: comptime_int       = 1 << 20;
pub const GIO_BANK0_LINE_GPIO_021: comptime_int       = 1 << 21;
pub const GIO_BANK0_LINE_2712_G21_FS: comptime_int    = 1 << 21;
pub const GIO_BANK0_LINE_GPIO_022: comptime_int       = 1 << 22;
pub const GIO_BANK0_LINE_GPIO_023: comptime_int       = 1 << 23;
pub const GIO_BANK0_LINE_GPIO_024: comptime_int       = 1 << 24;
pub const GIO_BANK0_LINE_BT_RTS: comptime_int         = 1 << 24;
pub const GIO_BANK0_LINE_GPIO_025: comptime_int       = 1 << 25;
pub const GIO_BANK0_LINE_BT_CTS: comptime_int         = 1 << 25;
pub const GIO_BANK0_LINE_GPIO_026: comptime_int       = 1 << 26;
pub const GIO_BANK0_LINE_BT_TXD: comptime_int         = 1 << 26;
pub const GIO_BANK0_LINE_GPIO_027: comptime_int       = 1 << 27;
pub const GIO_BANK0_LINE_BT_RXD: comptime_int         = 1 << 27;
pub const GIO_BANK0_LINE_GPIO_028: comptime_int       = 1 << 28;
pub const GIO_BANK0_LINE_WL_ON: comptime_int          = 1 << 28;
pub const GIO_BANK0_LINE_GPIO_029: comptime_int       = 1 << 29;
pub const GIO_BANK0_LINE_BT_ON: comptime_int          = 1 << 29;
pub const GIO_BANK0_LINE_GPIO_030: comptime_int       = 1 << 30;
pub const GIO_BANK0_LINE_WIFI_SDIO_CLK: comptime_int  = 1 << 30;
pub const GIO_BANK0_LINE_GPIO_031: comptime_int       = 1 << 31;
pub const GIO_BANK0_LINE_WIFI_SDIO_CMD: comptime_int  = 1 << 31;

pub const GIO_BANK1_LINE_GPIO_032: comptime_int     = 1 << 0;
pub const GIO_BANK1_LINE_WIFI_SDIO_D0: comptime_int = 1 << 0;
pub const GIO_BANK1_LINE_GPIO_033: comptime_int     = 1 << 1;
pub const GIO_BANK1_LINE_WIFI_SDIO_D1: comptime_int = 1 << 1;
pub const GIO_BANK1_LINE_GPIO_034: comptime_int     = 1 << 2;
pub const GIO_BANK1_LINE_WIFI_SDIO_D2: comptime_int = 1 << 2;
pub const GIO_BANK1_LINE_GPIO_035: comptime_int     = 1 << 3;
pub const GIO_BANK1_LINE_WIFI_SDIO_D3: comptime_int = 1 << 3;

const GIO_ALWAYS_ON_BASE: comptime_int              = BASE + 0x1517C00;
pub const GIO_ALWAYS_ON_BANK0_DATA: *volatile u32   = @ptrFromInt(GIO_ALWAYS_ON_BASE + (GIO_BANK_SIZE * 0) + 0x04);
pub const GIO_ALWAYS_ON_BANK0_IO_DIR: *volatile u32 = @ptrFromInt(GIO_ALWAYS_ON_BASE + (GIO_BANK_SIZE * 0) + 0x08);
pub const GIO_ALWAYS_ON_BANK1_DATA: *volatile u32   = @ptrFromInt(GIO_ALWAYS_ON_BASE + (GIO_BANK_SIZE * 1) + 0x04);
pub const GIO_ALWAYS_ON_BANK1_IO_DIR: *volatile u32 = @ptrFromInt(GIO_ALWAYS_ON_BASE + (GIO_BANK_SIZE * 1) + 0x08);

pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_00: comptime_int       = 1 <<  0;
pub const GIO_ALWAYS_ON_BANK0_LINE_RP1_SDA: comptime_int       = 1 <<  0;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_01: comptime_int       = 1 <<  1;
pub const GIO_ALWAYS_ON_BANK0_LINE_RP1_SCL: comptime_int       = 1 <<  1;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_02: comptime_int       = 1 <<  2;
pub const GIO_ALWAYS_ON_BANK0_LINE_RP1_RUN: comptime_int       = 1 <<  2;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_03: comptime_int       = 1 <<  3;
pub const GIO_ALWAYS_ON_BANK0_LINE_SD_IOVDD_SEL: comptime_int  = 1 <<  3;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_04: comptime_int       = 1 <<  4;
pub const GIO_ALWAYS_ON_BANK0_LINE_SD_PWR_ON: comptime_int     = 1 <<  4;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_05: comptime_int       = 1 <<  5;
pub const GIO_ALWAYS_ON_BANK0_LINE_SD_CDET_N: comptime_int     = 1 <<  5;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_06: comptime_int       = 1 <<  6;
pub const GIO_ALWAYS_ON_BANK0_LINE_SD_FLG_N: comptime_int      = 1 <<  6;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_07: comptime_int       = 1 <<  7;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_08: comptime_int       = 1 <<  8;
pub const GIO_ALWAYS_ON_BANK0_LINE_2712_WAKE: comptime_int     = 1 <<  8;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_09: comptime_int       = 1 <<  9;
pub const GIO_ALWAYS_ON_BANK0_LINE_2712_STAT_LED: comptime_int = 1 <<  9;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_10: comptime_int       = 1 << 10;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_11: comptime_int       = 1 << 11;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_12: comptime_int       = 1 << 12;
pub const GIO_ALWAYS_ON_BANK0_LINE_PMIC_INT: comptime_int      = 1 << 12;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_13: comptime_int       = 1 << 13;
pub const GIO_ALWAYS_ON_BANK0_LINE_UART_TX_FS: comptime_int    = 1 << 13;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_14: comptime_int       = 1 << 14;
pub const GIO_ALWAYS_ON_BANK0_LINE_UART_RX_FS: comptime_int    = 1 << 14;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_15: comptime_int       = 1 << 15;
pub const GIO_ALWAYS_ON_BANK0_LINE_GPIO_16: comptime_int       = 1 << 16;

pub const GIO_ALWAYS_ON_BANK1_LINE_SGPIO_00: comptime_int  = 1 << 0;
pub const GIO_ALWAYS_ON_BANK1_LINE_HDMI0_SCL: comptime_int = 1 << 0;
pub const GIO_ALWAYS_ON_BANK1_LINE_SGPIO_01: comptime_int  = 1 << 1;
pub const GIO_ALWAYS_ON_BANK1_LINE_HDMI0_SDA: comptime_int = 1 << 1;
pub const GIO_ALWAYS_ON_BANK1_LINE_SGPIO_02: comptime_int  = 1 << 2;
pub const GIO_ALWAYS_ON_BANK1_LINE_HDMI1_SCL: comptime_int = 1 << 2;
pub const GIO_ALWAYS_ON_BANK1_LINE_SGPIO_03: comptime_int  = 1 << 3;
pub const GIO_ALWAYS_ON_BANK1_LINE_HDMI1_SDA: comptime_int = 1 << 3;
pub const GIO_ALWAYS_ON_BANK1_LINE_SGPIO_04: comptime_int  = 1 << 4;
pub const GIO_ALWAYS_ON_BANK1_LINE_PMIC_SCL: comptime_int  = 1 << 4;
pub const GIO_ALWAYS_ON_BANK1_LINE_SGPIO_05: comptime_int  = 1 << 5;
pub const GIO_ALWAYS_ON_BANK1_LINE_PMIC_SDA: comptime_int  = 1 << 5;

// zig fmt: on

// Output == 0
// Input == 1

pub fn setPinOutput(reg: *volatile u32, pinNumber: u32) void {
    reg.* &= ~pinNumber;
}

pub fn setPinInput(reg: *volatile u32, pinNumber: u32) void {
    reg.* |= pinNumber;
}
