using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cars : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DetailsView1.DataBind();
        GridView1.DataBind();
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        Timer1.Enabled = CheckBox1.Checked;
    }

}