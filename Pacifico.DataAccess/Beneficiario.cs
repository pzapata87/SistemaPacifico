//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pacifico.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Beneficiario
    {
        public int Cod_Benef { get; set; }
        public string Num_DNI { get; set; }
        public string Txt_Ape_Pat { get; set; }
        public string Txt_Nombre { get; set; }
        public string Txt_Ape_Mat { get; set; }
        public int Co_Poliza { get; set; }
        public decimal Po_Cap_Aseg { get; set; }
        public System.DateTime Fec_Nac { get; set; }
    
        public virtual Poliza Poliza { get; set; }
    }
}
