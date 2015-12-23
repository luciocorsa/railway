#include <Railway/Crypto/RWBlowfish.h>

/**
 * PBox e SBox
 */
uint		blowfish_p_box[ BLOWFISH_ROUNDS + 2 ] =
{
		0x6337BEC0L, 0x723F27B7L, 0x4CD48CB2L, 0x2578F2ACL,
		0xEE1D67A7L, 0x34805BA4L, 0xFD24C19EL, 0xD6B93699L,
		0x1C2C2A96L, 0x89F2118FL, 0xBF65F58BL, 0x98FA6A86L,
		0x719ED081L, 0x4A43457BL, 0x80A63978L, 0x594A9E73L,
		0x8FAD926FL, 0x6952F76AL
};

uint		blowfish_s_box[ 4 ][ 256 ] = 
{
	{
		0x328F649EL, 0x4196BD95L, 0x1A3B3390L, 0xE3D0988AL, 0xBC74FE85L, 0xF2D7F182L, 0xCC7C677CL, 0xA520CC77L,
		0xDB83C074L, 0xB428356EL, 0x8DBC9B69L, 0xC32F8F66L, 0x9CC4F460L, 0x76696A5BL, 0xACCC5D58L, 0x8570C352L,
		0x5E15384DL, 0x94782C4AL, 0x6D1C9144L, 0xA37F8541L, 0x7C24EA3CL, 0x56B86036L, 0x8C2B5433L, 0x65C0B92EL,
		0x3E652E28L, 0x74C82225L, 0x4D6C8820L, 0x2611ED1AL, 0x5C74E117L, 0x36185612L, 0x6C7B4AFEL, 0x4520AFF9L,
		0x1EB425F4L, 0xE7598AEEL, 0x2DBC7EEBL, 0xF661E3E6L, 0xD0F559E0L, 0x16684DDDL, 0xDFFDB2D8L, 0x2570A6D4L,
		0xEE141BCFL, 0xC7A981CAL, 0xFD1C74C6L, 0xD6B1DAC1L, 0xB0554FBCL, 0xE6B843B8L, 0xBF5DA8B3L, 0xF5C09CAFL,
		0xCE6411AAL, 0xA7F977A5L, 0xDD6C6BA1L, 0xB610D09CL, 0x90A54697L, 0xC6183993L, 0x9FAD9F8EL, 0xD520928BL,
		0xAEB4F885L, 0x87596D80L, 0xBDBC617DL, 0x9D1C5758L, 0x76B0BD53L, 0x5055324DL, 0x86B8264AL, 0x5F5C8B45L,
		0x38F1F13FL, 0x1196663AL, 0x47F95A37L, 0xF9498E23L, 0xD2DEF41EL, 0xAB826919L, 0x8427CF14L, 0x5DBB44FEL,
		0x932F38FBL, 0x7CCBF6EDL, 0xE8A1DEE6L, 0xC14553E1L, 0x9ADAB8DBL, 0xD04DACD8L, 0xAAE122D3L, 0x838687CDL,
		0x5C2BEDC8L, 0x928EE0C5L, 0x6B3256BFL, 0x44C7BBBAL, 0x7A3AAFB7L, 0x53CE24B1L, 0x2D738AACL, 0x63D67DA9L,
		0x3C7AE3A3L, 0x151F589EL, 0x4B824C9BL, 0x2427B295L, 0xEDBB2790L, 0x332E1B8DL, 0xFDC38087L, 0x43367484L,
		0x1CCAD97FL, 0xE56F4F79L, 0xBE13B474L, 0xF477A871L, 0xCD1B1D6BL, 0xA7B08366L, 0xDD237663L, 0xB6B7DC5DL,
		0x8F5C5158L, 0xC5BF4555L, 0x9E63AB4FL, 0xD4C69E4CL, 0xAD6B1447L, 0x87107941L, 0xBD736D3EL, 0x9617D239L,
		0x6FAC4833L, 0xA51F3B30L, 0x7EB3A12BL, 0x57581625L, 0x8DBBFA22L, 0x675F6F1DL, 0x40F4D517L, 0x7667C914L,
		0x4FFC3EFFL, 0x94768BF2L, 0x6D1BF0EDL, 0x47AF66E8L, 0x2054CBE2L, 0xE9E841DDL, 0x2F5B34DAL, 0xF8F09AD4L,
		0xD195FFCFL, 0x17F8F3CCL, 0xE09C69C6L, 0x27FF5CC3L, 0xF0A4C2BEL, 0xC94837B8L, 0xA2DD9DB3L, 0xD85090B0L,
		0xB1E5F6AAL, 0x8A896BA5L, 0xC0EC5FA2L, 0x9A91C49CL, 0x73353A97L, 0xA9982D94L, 0x823D938EL, 0x5BD1F889L,
		0x9144EC86L, 0x6AD96280L, 0x447EC77BL, 0x7AE1BB78L, 0x53853072L, 0x2C2A966DL, 0x628D896AL, 0x3B31EF64L,
		0x7194E261L, 0x4A39585CL, 0x24CDBD56L, 0x5A40B153L, 0x33D5264EL, 0xFC7A8C48L, 0x42DD8045L, 0x1B81E540L,
		0xE4265B3AL, 0x2A894E37L, 0xF42DB432L, 0x3A90A72EL, 0x13351D29L, 0xDCC98224L, 0x223D7620L, 0xEBD1DB1BL,
		0xC4765116L, 0xFAD94512L, 0xD47DAAFDL, 0xAD2220F8L, 0xE38513F4L, 0xBC2979EFL, 0xF28C6CEBL, 0xCB31D2E6L,
		0xA4C647E1L, 0xDA393BDDL, 0xB4CDA0D8L, 0x8D7216D3L, 0xC3D5FACFL, 0x9C796FCAL, 0xD2DC63C7L, 0xAB81C8C1L,
		0x84253EBCL, 0xBA8831B9L, 0x942D97B3L, 0x6DC2FCAEL, 0xA335F0ABL, 0x7CC965A5L, 0x556ECBA0L, 0x8BD1BE9DL,
		0x64753497L, 0xD14B1B90L, 0xAAE0818BL, 0x8385E686L, 0xB9E8DA82L, 0x928C4F7DL, 0x6B31B578L, 0xA194A874L,
		0x7B381E6FL, 0xB19B126CL, 0x8A407766L, 0x63D4DD61L, 0x9947D05EL, 0x72DC4658L, 0x4B81AB53L, 0x81E49F50L,
		0x5B88144AL, 0xC75EEC43L, 0xFDC1DF40L, 0xD666553BL, 0xAFFABA35L, 0xE56DAE32L, 0xBE12232DL, 0xF4751729L,
		0xCE1A7C24L, 0xA7AEE21FL, 0xDD21D61BL, 0xB6B64B16L, 0x8F5AB111L, 0xC5BDA4FDL, 0x9E621AF8L, 0xD4C5FDF4L,
		0xAE6973EFL, 0x87FED8EAL, 0xBD71CCE6L, 0x961641E1L, 0x6FAAA7DCL, 0xA51D9BD8L, 0x7EB210D3L, 0x585675CEL,
		0x8EB969CAL, 0x675ECFC5L, 0x9DC1C2C2L, 0x766638BCL, 0x4FFA9DB7L, 0x856D91B4L, 0x5E12F6AEL, 0x38A66CA9L,
		0x6E195FA6L, 0x47AEC5A0L, 0x20523A9BL, 0x56B52E98L, 0x2F5A9492L, 0x65BD878FL, 0xD1936E88L, 0x18F66284L,
		0xE19BC87FL, 0xBA3F3D7AL, 0xF0A23176L, 0xC9479671L, 0xA2DBFC6CL, 0xD84EEF68L, 0xB1E36563L, 0xE8565860L 
	},
    {
		0x5B2B46BCL, 0x793AF8ABL, 0xE510DFA4L, 0xBEA5559EL, 0x984ABA99L, 0xCEADAE96L, 0xA7512390L, 0x80E6898BL,
		0x322F6481L, 0xFBC3C97BL, 0xD4683F76L, 0x1BCB3273L, 0xE470986DL, 0xBD14FD68L, 0x96A97363L, 0xCC1C675FL,
		0xA5B0CC5AL, 0x7E554255L, 0xB4B83551L, 0x8E5C9B4CL, 0x67F11047L, 0x9D64F443L, 0x76F9693EL, 0x4F9DCF39L,
		0x28424434L, 0x5EA53830L, 0x38499D2BL, 0x11DE1326L, 0x4751F622L, 0x20E56C1DL, 0xE98AD118L, 0x2FEDC514L,
		0xF8923BFFL, 0xD136A0FAL, 0x189994F6L, 0xE13EF9F1L, 0xBAD26FECL, 0xF04562E8L, 0x6C1B4AE1L, 0xA27E3DDEL,
		0x7B23A3D8L, 0x55B818D3L, 0x2E5C7ECEL, 0x64BF71CAL, 0x3D64D7C5L, 0x16F84CC0L, 0x4C6B40BCL, 0xA1DEE6A7L,
		0x1DB4CDA0L, 0xE658439BL, 0x2CBB3698L, 0xF5609C92L, 0xCEF4118DL, 0x1567F58AL, 0xDEFC6A84L, 0xB7A0D07FL,
		0xED14C37CL, 0xC6A83976L, 0x9F4D9E71L, 0xD5B0926EL, 0xAE54F868L, 0x88E96D63L, 0xBE5C6160L, 0x97F0C65AL,
		0x70953C55L, 0xA6F82F52L, 0x7F9D954CL, 0x5841FA47L, 0x8FA4EE44L, 0x6849633EL, 0x41DDC939L, 0x7750BC36L,
		0x50E53230L, 0x2989972BL, 0xF22EFD26L, 0x3891F122L, 0x1236661DL, 0x48995A1AL, 0x213DBF14L, 0xEAD235FFL,
		0x304528FCL, 0xF9D98EF6L, 0xD27EF3F1L, 0x18E1E7EEL, 0xE2855CE8L, 0xBB2AC2E3L, 0xF18DB6E0L, 0xCA322BDAL,
		0xA3C690D5L, 0xD93984D2L, 0xB2CEEACCL, 0xE841DDC9L, 0xC2D553C4L, 0x9B7AB8BEL, 0xD1DDACBBL, 0xAA8221B6L,
		0x832687B0L, 0xB9897AADL, 0x922EE0A8L, 0x6CC255A2L, 0xA235499FL, 0x7BCAAF9AL, 0x546E2494L, 0x8AD11891L,
		0x63767D8CL, 0x99D97188L, 0x727ED683L, 0x4C224C7EL, 0x82853F7AL, 0x5B2AA575L, 0x34BE1A70L, 0x6A31FE6CL,
		0x43C67367L, 0x1C6AD962L, 0x52CDCD5EL, 0x2C724259L, 0xF517A854L, 0x3B7A9B50L, 0x141E114BL, 0xDDB37646L,
		0x23266A42L, 0xECBACF3DL, 0xC55F4538L, 0xFCC23834L, 0xD5669E2FL, 0xAEFB132AL, 0xE46EF726L, 0xBD136D21L,
		0xF376601DL, 0xCC1AC618L, 0xA5AF3B13L, 0xDC222FFFL, 0xB5B694FAL, 0x8E5BFAF5L, 0xC4BEEDF1L, 0x9D6363ECL,
		0x76F7C8E7L, 0xAC6ABCE3L, 0x85FF31DEL, 0x5FA397D9L, 0x95168BD5L, 0x6EABF0D0L, 0x474F66CBL, 0x7DB259C7L,
		0x5657BFC2L, 0x2FEC34BDL, 0x665F28B9L, 0x3FF38DB4L, 0x1898F3AFL, 0x4EFBE6ABL, 0x279F5CA6L, 0xF044C1A1L,
		0x36A7B59DL, 0xFF4B2A98L, 0xD9E09093L, 0x1F53848FL, 0xE8E8E98AL, 0xC18C5F85L, 0xF7EF5281L, 0xD094B87CL,
		0xA9382D77L, 0xDF9B2173L, 0xB940866EL, 0xEFA37A6AL, 0xC847DF65L, 0xA1DC5560L, 0xD74F495CL, 0xB0E4AE57L,
		0x89882452L, 0xBFEB174EL, 0x99907D49L, 0x7234E244L, 0xA897D640L, 0x813C4B3BL, 0xB79F3F38L, 0x9044A432L,
		0x69D81A2DL, 0x9F4BFE2AL, 0x79E07324L, 0x5284D81FL, 0x88E7CC1CL, 0x618C4216L, 0x97EF3513L, 0x70939BFEL,
		0x493810F8L, 0x23CD76F3L, 0x594069F0L, 0x32D4CFEAL, 0xFB7944E5L, 0x41DC38E2L, 0x1A809DDCL, 0xE32513D7L,
		0x2988F7D4L, 0xF32C6CCEL, 0xCCC1D1C9L, 0x1234C5C6L, 0xDBC93BC0L, 0xB46DA0BBL, 0xEAD094B8L, 0xC375F9B2L,
		0xF9D8EDAFL, 0xD37C62AAL, 0xAC21C8A4L, 0xE284BBA1L, 0xBB29319CL, 0x94BD9696L, 0xCA308A93L, 0xA3C5F08EL,
		0x7C696588L, 0xB3CC5985L, 0x8C71BE80L, 0x6515347AL, 0x9B782777L, 0x741D8D72L, 0x4DB2F26CL, 0x8325E669L,
		0x5CB95B64L, 0x365EC15EL, 0x6CC1B55BL, 0x45652A56L, 0x1EFA8F50L, 0x546D834DL, 0x2D11E948L, 0xF6A65E42L,
		0x3D19523FL, 0x16AEB73AL, 0xDF522D34L, 0x25B52031L, 0xEE5A862CL, 0xC7EEEB26L, 0xFD61DF23L, 0xD6F6541EL,
		0xB09ABA18L, 0xE6FDAE15L, 0xBFA22310L, 0xF51517FCL, 0xCEAA7CF7L, 0xA74EE2F2L, 0xDDB1D5EEL, 0xB6564BE9L,
		0x90EAB0E4L, 0xC65DA4E0L, 0x9FF219DBL, 0x78967FD6L, 0xAEFA72D2L, 0x879ED8CDL, 0x60434DC8L, 0x96A641C4L,
		0x704AA7BFL, 0x49DF1CBAL, 0x7F5210B6L, 0x58E675B1L, 0x8E5969ADL, 0x67EECEA8L, 0x409344A3L, 0x76F6379FL
	},
    {
		0xEAE657A2L, 0xFAEEB099L, 0xD3922594L, 0xAC378B8EL, 0x85CCF089L, 0xBB3FE486L, 0x94D35980L, 0x6D78BF7BL,
		0x471C3476L, 0x7D7F2872L, 0x56248D6DL, 0x2FB8F368L, 0x652BE764L, 0x3EC05C5FL, 0x1765C25AL, 0xE0F93755L,
		0x457BDD40L, 0xB151C439L, 0x8AE63A33L, 0xC0592D30L, 0x9AEE932BL, 0x7392F825L, 0xA9F5EC22L, 0x829A611DL,
		0x5B3EC717L, 0x34D33C12L, 0x6A4630FFL, 0x44DA96F9L, 0x1D7FFBF4L, 0xE62470EFL, 0xBFB8D6EAL, 0xF52BCAE6L,
		0xCEC03FE1L, 0xA764A5DCL, 0x81F91AD6L, 0xB76CFED3L, 0x901073CEL, 0xC67367CAL, 0x9F18CCC5L, 0x78AD42C0L,
		0xAE2035BCL, 0x87B49BB7L, 0x615910B2L, 0x97BCF4AEL, 0x706069A9L, 0x49F5CFA4L, 0x7F68C3A0L, 0x58FC389BL,
		0x31A19E96L, 0x67149192L, 0x41A9F78DL, 0xAD7FDE86L, 0xE3E2D282L, 0xBC86477DL, 0x952BAD78L, 0xCB8EA074L,
		0xA432166FL, 0x7EC77B6AL, 0xB43A6F66L, 0x8DCFD461L, 0x66734A5CL, 0x9CD63D58L, 0x757BA353L, 0x4E1F184EL,
		0x8482FC4AL, 0x5E277245L, 0x37BBD740L, 0x6D2FCB3CL, 0x46C34037L, 0x1F68A632L, 0xE8FC1B2DL, 0x2E6FFF29L,
		0xF7147424L, 0xD1A8DA1FL, 0x171BCD1BL, 0xE0B04316L, 0xB955A811L, 0xEFB89CFDL, 0xC85C11F8L, 0xA1F177F3L,
		0x7B95DCEDL, 0xB1F8D0EAL, 0x8A9D46E5L, 0x6341ABDFL, 0x99A49FDCL, 0x724914D7L, 0x4BDE7AD1L, 0x2482DFCCL,
		0xEE2755C7L, 0xC7BBBAC2L, 0xFD2EAEBEL, 0xD6C323B9L, 0xAF6789B4L, 0x88FCEEAEL, 0xBE6FE2ABL, 0x971357A6L,
		0x71A8BDA0L, 0xA71BB09DL, 0x80B02698L, 0x59548B92L, 0x8FB77F8FL, 0x685CE48AL, 0x41F05A84L, 0x78634E81L,
		0x51F8B37CL, 0x2A9D2976L, 0x60101C73L, 0x39A4826EL, 0x1249E768L, 0x48ACDB65L, 0x21505060L, 0xEBE5B65AL,
		0x3158A957L, 0xFAEC1F52L, 0x4F676C45L, 0x28FCD140L, 0xF1A0473BL, 0xCB45AC36L, 0x11A8A032L, 0xDA4C152DL,
		0xB3E17B28L, 0xE9546E24L, 0xC2E8D41FL, 0x9B8D491AL, 0x7532AF14L, 0xAB95A211L, 0x843918FCL, 0x5DCE7DF6L,
		0x934171F3L, 0x6CD5D7EEL, 0x457A4CE8L, 0x7BDD40E5L, 0x5581A5E0L, 0x2E261BDAL, 0x6489FED7L, 0x3D2E74D1L,
		0x16C2D9CCL, 0x4C35CDC9L, 0x25CA42C3L, 0xEE6EA8BEL, 0x35D19BBBL, 0xFE7611B5L, 0x44D9F5B2L, 0x1D7E6AADL,
		0xE622D0A7L, 0x2C85C3A4L, 0xF52A399FL, 0xCEBE9E99L, 0x15319296L, 0xDEC6F791L, 0xB76A6D8BL, 0xEDCD6088L,
		0xC672C683L, 0x9F173B7DL, 0xD57A2F7AL, 0xAE1E9575L, 0x88B3FA6FL, 0xBE26EE6CL, 0x97BA6367L, 0xCD2D5763L,
		0xDC35B05AL, 0x2298A457L, 0xEB3D1952L, 0xC5D17E4CL, 0xFB447249L, 0xD4D9D844L, 0xAD7D4D3EL, 0xE3E0413BL,
		0xBC85A636L, 0x95291C30L, 0xCB8CFF2DL, 0xA5317528L, 0x7EC6DA22L, 0xB439CE1FL, 0x8DCD431AL, 0xC3403716L,
		0x9CD59D11L, 0x757912FCL, 0xABDCF6F8L, 0x85816BF3L, 0x5E25D1EEL, 0x9488C4EAL, 0x6D2D3AE5L, 0x46C29FE0L,
		0x7C3593DCL, 0x55C9F8D7L, 0x2F6E6ED2L, 0x65D162CEL, 0x3E75C7C9L, 0x74D8BBC5L, 0x4D7D30C0L, 0x262196BBL,
		0x5C8589B7L, 0x3529EFB2L, 0xFFBE64ADL, 0x453158A9L, 0x1EC5BDA4L, 0xE76A339FL, 0x2DCD269BL, 0xF6718C96L,
		0xCF16F191L, 0x1579E58DL, 0xDF1E5B88L, 0xB8B2C083L, 0xEE25B47FL, 0xC7BA297AL, 0xFD2D1D77L, 0xD6C18271L,
		0xAF66E86CL, 0xE5C9DB69L, 0xBF6D5163L, 0x9812B65EL, 0xCE75AA5BL, 0xA71A1F55L, 0x80AE8550L, 0xB621794DL,
		0x8FB6DE47L, 0x685A5442L, 0x9FBD473FL, 0x7862AD39L, 0xAEC5A036L, 0x87691631L, 0x60FE7B2BL, 0x96716F28L,
		0x6F16D423L, 0x49AA4A1DL, 0x7F1D3E1AL, 0x58B2A315L, 0x315619FFL, 0x67B9FCFCL, 0x405E72F7L, 0x19F2D7F1L,
		0x4F66CBEEL, 0x29FA40E9L, 0x5F6D34E5L, 0x6E758DDCL, 0x4719F2D7L, 0x20AE68D2L, 0x56215CCEL, 0x2FB5C1C9L,
		0xF95A37C4L, 0x3FBD2AC0L, 0x186290BBL, 0xE1F6F5B6L, 0x2769E9B2L, 0xF0FE5EADL, 0xC9A2C4A8L, 0xFF15B7A4L,
		0xD9AA2D9FL, 0xB24E929AL, 0xE8B18696L, 0xC156EC91L, 0x9AEB618CL, 0xD05E5588L, 0xA9F2BA83L, 0xDF65AE80L
	},
    {
		0xD3A6A6DFL, 0xE3AD10D6L, 0xBC5275D1L, 0x95E6DACCL, 0x6E8B50C6L, 0xA4EE44C3L, 0x7D92A9BEL, 0x3FD3DDAAL,
		0xABA9C4A3L, 0x844E3A9EL, 0xBAB12E9BL, 0x93559395L, 0x6DEAF990L, 0x468E6E8BL, 0x7CF26287L, 0x5596C782L,
		0x2E3B3D7DL, 0xF7CFA278L, 0xD0741872L, 0x16D7FB6FL, 0xE07B716AL, 0xB920D664L, 0xEF83CA61L, 0xC8283F5CL,
		0x1D928C4FL, 0x8A687348L, 0xC0CB6745L, 0x9970CD40L, 0x7214423AL, 0xA8773637L, 0x811C9B32L, 0x5AB1112CL,
		0x33557627L, 0x6AB86A24L, 0x435DCF1EL, 0x1CF14519L, 0x52643816L, 0x2BF99E10L, 0xF49D13FBL, 0x3A10F7F8L,
		0x13A56CF2L, 0xDD4AD2EDL, 0xB6DE47E8L, 0xEC513BE4L, 0xC5E6A1DFL, 0xFB5994DCL, 0xD4EDFAD6L, 0xAD926FD1L,
		0x8736D5CCL, 0xBD99C8C8L, 0x963E3EC3L, 0x6FD3A3BEL, 0x487719B9L, 0x7EDAFCB5L, 0x577F72B0L, 0x3023D7ABL,
		0xFAB84DA5L, 0x402B40A2L, 0x19BFA69DL, 0xE2641B97L, 0x28C7FF94L, 0xF16C758FL, 0xCA10DA89L, 0x1073CE86L,
		0xDA184381L, 0xB3ACA97BL, 0xE91F9C78L, 0xC2B41273L, 0x9B58776DL, 0xD1BB6B6AL, 0xAA60D065L, 0x84F5465FL,
		0xBA68395CL, 0x93FC9F57L, 0x6CA11451L, 0xA214F84EL, 0x7BA86E49L, 0x544DD343L, 0x8AB0C740L, 0x64543C3BL,
		0x3DE9A235L, 0x168E1730L, 0x4CF1FB2CL, 0x25957027L, 0xEE3AD622L, 0x349DC91EL, 0xFD413F19L, 0xD7D6A414L,
		0x1D499810L, 0xE6DDFDFBL, 0xBF8273F6L, 0x9827D8F1L, 0x71BB4EEBL, 0xA72E42E8L, 0x81C3A7E3L, 0x5A671CDDL,
		0x90CA10DAL, 0x696F76D5L, 0x4213DBCFL, 0x7877CFCCL, 0x511B44C7L, 0x2AB0AAC1L, 0xF4541FBCL, 0x3AB713B9L,
		0x135C78B3L, 0xDCF0DEAEL, 0x2263D1ABL, 0xEBF847A5L, 0xC49CACA0L, 0xFA10A09DL, 0xD4A41597L, 0xAD497B92L,
		0xE3AC6F8FL, 0xBC50D489L, 0x95E54A84L, 0xCB583D81L, 0xA4ECA37BL, 0x7E911876L, 0xB4F4FC73L, 0x8D99716DL,
		0x663DD768L, 0x9CA0CA65L, 0x7545405FL, 0x4ED9A55AL, 0x844C9957L, 0x5EE1FF51L, 0x3785744CL, 0x1F32433EL,
		0x8BF82A37L, 0xC16B1E34L, 0x9AFF832EL, 0x74A4E929L, 0x4D485E24L, 0x26DDC31FL, 0x5C50B71BL, 0x35E42D16L,
		0xFE899211L, 0x44EC86FDL, 0x1E91EBF8L, 0xE73561F3L, 0x2D9854EFL, 0xF63DBAEAL, 0xCFD12FE5L, 0x154423E1L,
		0xDED988DCL, 0xB77DEED7L, 0xEEE1E2D3L, 0xC78557CEL, 0xA02ABCC9L, 0xD68DB0C5L, 0xAF3126C0L, 0x88C68BBBL,
		0xBE397FB7L, 0x97CDE4B2L, 0xCE40D8AEL, 0xA7D54DA9L, 0x807AB3A4L, 0xB6DDA6A0L, 0x8F811C9BL, 0x68268196L,
		0x9E897592L, 0x772DDB8DL, 0x51C25088L, 0x87354484L, 0x60C9A97FL, 0x396E1F7AL, 0x6FD11276L, 0x48767871L,
		0x211ADD6CL, 0x587DD168L, 0x31224663L, 0xFAB6AC5EL, 0x4029A05AL, 0x19BE1555L, 0xE2627A50L, 0x28C56E4CL,
		0xF16AD447L, 0x38CDC744L, 0x11723D3EL, 0xDA16A239L, 0x20799636L, 0xE91EFB30L, 0xC2B2712BL, 0xF8256428L,
		0xD1BACA22L, 0xAB5F3F1DL, 0xE1C2331AL, 0xBA669914L, 0xF0C98C11L, 0xC96EF2FCL, 0xA21267F6L, 0xD8755BF3L,
		0xB11AC0EEL, 0x8BAE36E8L, 0xC12129E5L, 0x9AB68FE0L, 0x735BF4DAL, 0xA9BEE8D7L, 0x82625DD2L, 0x5BF7C3CCL,
		0x916AB7C9L, 0x6BFE2CC4L, 0x44A392BEL, 0x7A1685BBL, 0x53AAEBB6L, 0x2C4F60B0L, 0x62B254ADL, 0x3B57B9A8L,
		0x71BAADA4L, 0x4B5E229FL, 0x24F3889AL, 0x5A667C96L, 0x33FAE191L, 0xFC9F578CL, 0x42124A88L, 0x1BA7B083L,
		0xE54B257EL, 0x2BAE197AL, 0xF4537E75L, 0x3AB67271L, 0x135AD76CL, 0xDCEF4D67L, 0x22624063L, 0xFBFEFF55L,
		0xD4A37550L, 0x1A16684DL, 0xE3AACE47L, 0xBC4F4342L, 0xF2B2373FL, 0xCB569C39L, 0x12B99036L, 0xDB5EF531L,
		0xB4F26B2BL, 0xEA665F28L, 0xC3FAC423L, 0xD2122D1AL, 0xABA69315L, 0x854BF8FFL, 0x5EDF6EFAL, 0x945261F7L,
		0x6DE7C7F1L, 0xA35ABAEEL, 0x7CEF30E9L, 0x559395E3L, 0x8BF689E0L, 0x659BEEDBL, 0x3E3F64D5L, 0x74A258D2L,
		0x4D47BDCDL, 0x26DB33C7L, 0x5C4E26C4L, 0x35E38CBFL, 0xFF88F1B9L, 0x45EBE5B6L, 0x1E8F5AB1L, 0xE734C0ABL
	}
};


/**
 * Feistell
 */
uint32_t	
RWBlowfishFeistell( blowfish_ctx *ctx, uint32_t x )
{
	uint16_t		a, b, c, d;
	uint32_t		y;
	
	d = ( uint16_t )( x & 0xff ); x >>= 8;
	c = ( uint16_t )( x & 0xff ); x >>= 8;
	b = ( uint16_t )( x & 0xff ); x >>= 8;
	a = ( uint16_t )( x & 0xff );
	
	y = ctx->S[0][a] + 
		ctx->S[1][b];
		
	y = y ^ ctx->S[2][c];
	y = y + ctx->S[3][d];

   return ( y );
}

/**
 * Crypt block
 */
void
RWBlowfishEnc( blowfish_ctx *ctx, uint32_t *xl, uint32_t *xr) 
{
    uint32_t  	Xl, Xr, temp;
    uint16_t 	i;

    Xl = *xl;
    Xr = *xr;

    for ( i = 0; i < BLOWFISH_ROUNDS; ++i ) 
    {
        Xl = Xl ^ ctx->P[ i ];
        Xr = RWBlowfishFeistell( ctx, Xl ) ^ Xr;

        temp = Xl;
        Xl   = Xr;
        Xr   = temp;
    }

    temp = Xl;
    Xl   = Xr;
    Xr   = temp;

    Xr = Xr ^ ctx->P[ BLOWFISH_ROUNDS ];
    Xl = Xl ^ ctx->P[ BLOWFISH_ROUNDS + 1];

    *xl = Xl;
    *xr = Xr;
}

/**
 * Decrypt block
 */
void	
RWBlowfishDec( blowfish_ctx *ctx, uint32_t *xl, uint32_t *xr ) 
{
    uint32_t 	Xl, Xr, temp;
    uint16_t 	i;

    Xl = *xl;
    Xr = *xr;

    for ( i = BLOWFISH_ROUNDS + 1; i > 1; --i ) 
    {
        Xl = Xl ^ ctx->P[ i ];
        Xr = RWBlowfishFeistell( ctx, Xl ) ^ Xr;

        temp = Xl;
        Xl   = Xr;
        Xr   = temp;
    }

    temp = Xl;
    Xl   = Xr;
    Xr   = temp;

    Xr = Xr ^ ctx->P[ 1 ];
    Xl = Xl ^ ctx->P[ 0 ];

    *xl = Xl;
    *xr = Xr;
}

/**
 * Setta la chiave
 */
void
RWBlowfishSetKey( blowfish_ctx *ctx, const unsigned char *key )
{
	uint32_t 	i, j, k;
    uint32_t	 	data, datal, datar, keysize;
	
    keysize   = 16;
    keysize >>= 3;

    for( i = 0; i < 4; i++ ) 
    {
        for( j = 0; j < 256; j++ )
            ctx->S[ i ][ j ] = blowfish_s_box[ i ][ j ];
    }

    j = 0;
    for( i = 0; i < BLOWFISH_ROUNDS + 2; ++i )
    {
        data = 0x00000000;
        for( k = 0; k < 4; ++k )
        {
            data = ( data << 8 ) | key[ j++ ];
            if( j >= keysize )
                j = 0;
        }
        ctx->P[ i ] = blowfish_p_box[ i ] ^ data;
    }

    datal = 0x00000000;
    datar = 0x00000000;

    for( i = 0; i < BLOWFISH_ROUNDS + 2; i += 2 )
    {
        RWBlowfishEnc( ctx, &datal, &datar );
        ctx->P[ i ] 	= datal;
        ctx->P[ i + 1 ] = datar;
    }

    for( i = 0; i < 4; i++ )
    {
       for( j = 0; j < 256; j += 2 )
       {
            RWBlowfishEnc( ctx, &datal, &datar );
            ctx->S[ i ][ j ] 	 = datal;
            ctx->S[ i ][ j + 1 ] = datar;
        }
    }
}

/**
 * Decrypt del blocco di 8 bytes
 */
void
RWBlowfishDecryptBlock( blowfish_ctx *ctx, const unsigned char input[ BLOWFISH_BLOCK_SIZE ], unsigned char output[ BLOWFISH_BLOCK_SIZE ] )
{
    uint32_t X0, X1;

    GET_UINT32_BE( X0, input,  0 ); 
    GET_UINT32_BE( X1, input,  4 ); 

    RWBlowfishDec( ctx, &X0, &X1 );

    PUT_UINT32_BE( X0, output,  0 );
    PUT_UINT32_BE( X1, output,  4 );
}
	  
/**
 * Decrypt di un blocco di lunghezza passata
 */
void
RWBlowfishDecryptBuffer( blowfish_ctx *ctx, size_t length, unsigned char *input, unsigned char *output )
{
    int 					i;
    unsigned char 		temp[ BLOWFISH_BLOCK_SIZE ];
	unsigned char 		iv[ BLOWFISH_BLOCK_SIZE ];
	
	memset( iv, 0, BLOWFISH_BLOCK_SIZE );
	
	while( length > 0 )
	{
		memcpy( temp, input, BLOWFISH_BLOCK_SIZE );
		RWBlowfishDecryptBlock( ctx, input, output );

		for( i = 0; i < BLOWFISH_BLOCK_SIZE; i++ )
			output[ i ] = ( unsigned char )( output[ i ] ^ iv[ i ] );

		memcpy( iv, temp, BLOWFISH_BLOCK_SIZE );

		input  += BLOWFISH_BLOCK_SIZE;
		output += BLOWFISH_BLOCK_SIZE;
		length -= BLOWFISH_BLOCK_SIZE;
	}
}

void	
RWBlowfishFree( blowfish_ctx *ctx )
{	
	memset( ( ( unsigned char* )ctx ), 0, sizeof( blowfish_ctx ) );
}

