#
# Makefile for at91 specific clk
#

obj-y += pmc.o sckc.o
obj-y += clk-slow.o clk-main.o clk-pll.o clk-plldiv.o clk-master.o
obj-y += clk-system.o clk-peripheral.o clk-programmable.o

obj-$(CONFIG_HAVE_AT91_UTMI)		+= clk-utmi.o
obj-$(CONFIG_HAVE_AT91_USB_CLK)		+= clk-usb.o
obj-$(CONFIG_HAVE_AT91_SMD)		+= clk-smd.o
obj-$(CONFIG_HAVE_AT91_H32MX)		+= clk-h32mx.o
obj-$(CONFIG_HAVE_AT91_GENERATED_CLK)	+= clk-generated.o
obj-$(CONFIG_SOC_AT91SAM9) 		+= at91sam9260.o
obj-$(CONFIG_SOC_AT91SAM9) 		+= at91sam9rl.o
obj-$(CONFIG_SOC_AT91SAM9) 		+= at91sam9x5.o
obj-$(CONFIG_SOC_SAMA5D2) 		+= sama5d2.o
obj-$(CONFIG_SOC_SAMA5D3)		+= dt-compat.o
obj-$(CONFIG_SOC_SAMA5D4) 		+= sama5d4.o
