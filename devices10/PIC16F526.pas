unit PIC16F526;

// Define hardware
{$SET PIC_MODEL    = 'PIC16F526'}
{$SET PIC_MAXFREQ  = 20000000}
{$SET PIC_NPINS    = 14}
{$SET PIC_NUMBANKS = 4}
{$SET PIC_NUMPAGES = 2}
{$SET PIC_MAXFLASH = 1024}

interface
var
  INDF            : byte absolute $0000;
  TMR0            : byte absolute $0001;
  PCL             : byte absolute $0002;
  STATUS          : byte absolute $0003;
  STATUS_RBWUF    : bit  absolute STATUS.7;
  STATUS_CWUF     : bit  absolute STATUS.6;
  STATUS_PA0      : bit  absolute STATUS.5;
  STATUS_TO       : bit  absolute STATUS.4;
  STATUS_PD       : bit  absolute STATUS.3;
  STATUS_Z        : bit  absolute STATUS.2;
  STATUS_DC       : bit  absolute STATUS.1;
  STATUS_C        : bit  absolute STATUS.0;
  FSR             : byte absolute $0004;
  OSCCAL          : byte absolute $0005;
  OSCCAL_CAL6     : bit  absolute OSCCAL.7;
  OSCCAL_CAL5     : bit  absolute OSCCAL.6;
  OSCCAL_CAL4     : bit  absolute OSCCAL.5;
  OSCCAL_CAL3     : bit  absolute OSCCAL.4;
  OSCCAL_CAL2     : bit  absolute OSCCAL.3;
  OSCCAL_CAL1     : bit  absolute OSCCAL.2;
  OSCCAL_CAL0     : bit  absolute OSCCAL.1;
  PORTB           : byte absolute $0006;
  PORTB_RB5       : bit  absolute PORTB.5;
  PORTB_RB4       : bit  absolute PORTB.4;
  PORTB_RB3       : bit  absolute PORTB.3;
  PORTB_RB2       : bit  absolute PORTB.2;
  PORTB_RB1       : bit  absolute PORTB.1;
  PORTB_RB0       : bit  absolute PORTB.0;
  PORTC           : byte absolute $0007;
  PORTC_RC5       : bit  absolute PORTC.5;
  PORTC_RC4       : bit  absolute PORTC.4;
  PORTC_RC3       : bit  absolute PORTC.3;
  PORTC_RC2       : bit  absolute PORTC.2;
  PORTC_RC1       : bit  absolute PORTC.1;
  PORTC_RC0       : bit  absolute PORTC.0;
  CM1CON0         : byte absolute $0008;
  CM1CON0_C1OUT   : bit  absolute CM1CON0.7;
  CM1CON0_C1OUTEN : bit  absolute CM1CON0.6;
  CM1CON0_C1POL   : bit  absolute CM1CON0.5;
  CM1CON0_C1T0CS  : bit  absolute CM1CON0.4;
  CM1CON0_C1ON    : bit  absolute CM1CON0.3;
  CM1CON0_C1NREF  : bit  absolute CM1CON0.2;
  CM1CON0_C1PREF  : bit  absolute CM1CON0.1;
  CM1CON0_C1WU    : bit  absolute CM1CON0.0;
  ADCON0          : byte absolute $0009;
  ADCON0_ANS1     : bit  absolute ADCON0.7;
  ADCON0_ANS0     : bit  absolute ADCON0.6;
  ADCON0_ADCS1    : bit  absolute ADCON0.5;
  ADCON0_ADCS0    : bit  absolute ADCON0.4;
  ADCON0_CHS1     : bit  absolute ADCON0.3;
  ADCON0_CHS0     : bit  absolute ADCON0.2;
  ADCON0_GO_nDONE : bit  absolute ADCON0.1;
  ADCON0_ADON     : bit  absolute ADCON0.0;
  ADRES           : byte absolute $000A;
  ADRES_ADRES7    : bit  absolute ADRES.7;
  ADRES_ADRES6    : bit  absolute ADRES.6;
  ADRES_ADRES5    : bit  absolute ADRES.5;
  ADRES_ADRES4    : bit  absolute ADRES.4;
  ADRES_ADRES3    : bit  absolute ADRES.3;
  ADRES_ADRES2    : bit  absolute ADRES.2;
  ADRES_ADRES1    : bit  absolute ADRES.1;
  ADRES_ADRES0    : bit  absolute ADRES.0;
  CM2CON0         : byte absolute $000B;
  CM2CON0_C2OUT   : bit  absolute CM2CON0.7;
  CM2CON0_C2OUTEN : bit  absolute CM2CON0.6;
  CM2CON0_C2POL   : bit  absolute CM2CON0.5;
  CM2CON0_C2PREF2 : bit  absolute CM2CON0.4;
  CM2CON0_C2ON    : bit  absolute CM2CON0.3;
  CM2CON0_C2NREF  : bit  absolute CM2CON0.2;
  CM2CON0_C2PREF1 : bit  absolute CM2CON0.1;
  CM2CON0_C2WU    : bit  absolute CM2CON0.0;
  VRCON           : byte absolute $000C;
  VRCON_VREN      : bit  absolute VRCON.7;
  VRCON_VROE      : bit  absolute VRCON.6;
  VRCON_VRR       : bit  absolute VRCON.5;
  VRCON_VR3       : bit  absolute VRCON.3;
  VRCON_VR2       : bit  absolute VRCON.2;
  VRCON_VR1       : bit  absolute VRCON.1;
  VRCON_VR0       : bit  absolute VRCON.0;
  EECON           : byte absolute $0021;
  EECON_FREE      : bit  absolute EECON.4;
  EECON_WRERR     : bit  absolute EECON.3;
  EECON_WREN      : bit  absolute EECON.2;
  EECON_WR        : bit  absolute EECON.1;
  EECON_RD        : bit  absolute EECON.0;
  EEDATA          : byte absolute $0025;
  EEADR           : byte absolute $0026;


  // -- Define RAM state values --

  {$CLEAR_STATE_RAM}

  {$SET_STATE_RAM '000-00C:SFR'}  // INDF, TMR0, PCL, STATUS, FSR, OSCCAL, PORTB, PORTC, CM1CON0, ADCON0, ADRES, CM2CON0, VRCON
  {$SET_STATE_RAM '00D-00F:GPR'} 
  {$SET_STATE_RAM '010-01F:GPR'} 
  {$SET_STATE_RAM '020-020:SFR'}  // mapped to INDF
  {$SET_STATE_RAM '021-021:SFR'}  // EECON
  {$SET_STATE_RAM '022-022:SFR'}  // mapped to PCL
  {$SET_STATE_RAM '025-026:SFR'}  // EEDATA, EEADR
  {$SET_STATE_RAM '027-027:SFR'}  // mapped to PORTC
  {$SET_STATE_RAM '02D-02F:GPR'} 
  {$SET_STATE_RAM '030-03F:GPR'} 
  {$SET_STATE_RAM '040-040:SFR'}  // mapped to INDF
  {$SET_STATE_RAM '04D-04F:GPR'} 
  {$SET_STATE_RAM '050-05F:GPR'} 
  {$SET_STATE_RAM '060-062:SFR'}  // mapped to INDF, EECON, PCL
  {$SET_STATE_RAM '065-065:SFR'}  // mapped to EEDATA
  {$SET_STATE_RAM '067-067:SFR'}  // mapped to PORTC
  {$SET_STATE_RAM '06D-06F:GPR'} 
  {$SET_STATE_RAM '070-07F:GPR'} 


  // -- Define mapped RAM --

  {$SET_MAPPED_RAM '020-020:bnk0'} // maps to INDF (bank 0)
  {$SET_MAPPED_RAM '022-024:bnk0'} // maps to PCL, STATUS, FSR (bank 0)
  {$SET_MAPPED_RAM '027-02C:bnk0'} // maps to PORTC, CM1CON0, ADCON0, ADRES, CM2CON0, VRCON (bank 0)
  {$SET_MAPPED_RAM '02D-02F:bnk0'} // maps to area 00D-00F (bank 0)
  {$SET_MAPPED_RAM '040-04C:bnk0'} // maps to INDF, TMR0, PCL, STATUS, FSR, OSCCAL, PORTB, PORTC, CM1CON0, ADCON0, ADRES, CM2CON0, VRCON (bank 0)
  {$SET_MAPPED_RAM '04D-04F:bnk0'} // maps to area 00D-00F (bank 0)
  {$SET_MAPPED_RAM '060-060:bnk0'} // maps to INDF (bank 0)
  {$SET_MAPPED_RAM '061-061:bnk1'} // maps to EECON (bank 1)
  {$SET_MAPPED_RAM '062-064:bnk0'} // maps to PCL, STATUS, FSR (bank 0)
  {$SET_MAPPED_RAM '065-066:bnk1'} // maps to EEDATA, EEADR (bank 1)
  {$SET_MAPPED_RAM '067-06C:bnk0'} // maps to PORTC, CM1CON0, ADCON0, ADRES, CM2CON0, VRCON (bank 0)
  {$SET_MAPPED_RAM '06D-06F:bnk0'} // maps to area 00D-00F (bank 0)


  // -- Un-implemented fields --

  {$SET_UNIMP_BITS '004:9F'} // FSR bits 6,5 un-implemented (read as 0)
  {$SET_UNIMP_BITS '005:FE'} // OSCCAL bit 0 un-implemented (read as 0)
  {$SET_UNIMP_BITS '006:3F'} // PORTB bits 7,6 un-implemented (read as 0)
  {$SET_UNIMP_BITS '007:3F'} // PORTC bits 7,6 un-implemented (read as 0)
  {$SET_UNIMP_BITS '00C:EF'} // VRCON bit 4 un-implemented (read as 0)
  {$SET_UNIMP_BITS '021:1F'} // EECON bits 7,6,5 un-implemented (read as 0)
  {$SET_UNIMP_BITS '026:3F'} // EEADR bits 7,6 un-implemented (read as 0)

  {$SET_UNIMP_BITS1 '004:80'} // FSR bit 7 un-implemented (read as 1)


  // -- PIN mapping --

  // Pin  1 : Vdd
  // Pin  2 : RB5/OSC1/CLKIN
  // Pin  3 : RB4/OSC2/CLKOUT
  // Pin  4 : RB3/MCLR/Vpp
  // Pin  5 : RC5/T0CKI
  // Pin  6 : RC4/C2OUT
  // Pin  7 : RC3
  // Pin  8 : RC2/CVref
  // Pin  9 : RC1/C2IN-
  // Pin 10 : RC0/C2IN+
  // Pin 11 : RB2/C1OUT/AN2
  // Pin 12 : RB1/C1IN-/AN1/ICSPCLK
  // Pin 13 : RB0/C1IN+/AN0/ICSPDAT
  // Pin 14 : Vss


  // -- RAM to PIN mapping --

  {$MAP_RAM_TO_PIN '006:0-13,1-12,2-11,3-4,4-3,5-2'} // PORTB
  {$MAP_RAM_TO_PIN '007:0-10,1-9,2-8,3-7,4-6,5-5'} // PORTC


  // -- Bits Configuration --

  // FOSC : Oscillator
  {$define _FOSC_LP           = $0FF8}  // LP oscillator and 18 ms DRT
  {$define _FOSC_XT           = $0FF9}  // XT oscillator and 18 ms DRT
  {$define _FOSC_HS           = $0FFA}  // HS oscillator and 18 ms DRT
  {$define _FOSC_EC           = $0FFB}  // EC oscillator with RB4 function on RB4/OSC2/CLKOUT and 1 ms DRT
  {$define _FOSC_INTRC_RB4    = $0FFC}  // INTRC with RB4 function on RB4/OSC2/CLKOUT and 1 ms DRT
  {$define _FOSC_INTRC_CLKOUT = $0FFD}  // INTRC with CLKOUT function on RB4/OSC2/CLKOUT and 1 ms DRT
  {$define _FOSC_ExtRC_RB4    = $0FFE}  // EXTRC with RB4 function on RB4/OSC2/CLKOUT and 1 ms DRT
  {$define _FOSC_ExtRC_CLKOUT = $0FFF}  // EXTRC with CLKOUT function on RB4/OSC2/CLKOUT and 1 ms DRT

  // WDTE : Watchdog Timer Enable bit
  {$define _WDTE_ON           = $0FFF}  // Enabled
  {$define _WDTE_OFF          = $0FF7}  // Disabled

  // CP : Code Protection bit
  {$define _CP_OFF            = $0FFF}  // Code protection off
  {$define _CP_ON             = $0FEF}  // Code protection on

  // MCLRE : Master Clear Enable bit
  {$define _MCLRE_ON          = $0FFF}  // RB3/MCLR functions as MCLR
  {$define _MCLRE_OFF         = $0FDF}  // RB3/MCLR functions as RB3, MCLR internally tied to Vdd

  // IOSCFS : Internal Oscillator Frequency Select
  {$define _IOSCFS_8MHz       = $0FFF}  // 8 MHz INTOSC Speed
  {$define _IOSCFS_4MHz       = $0FBF}  // 4 MHz INTOSC Speed

  // CPDF : Code Protection bit - Flash Data Memory
  {$define _CPDF_OFF          = $0FFF}  // Code protection off
  {$define _CPDF_ON           = $0F7F}  // Code protection on

implementation
end.
