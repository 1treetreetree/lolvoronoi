import megamu.mesh.*;

float[][] points = {{974, 247}, {711, 155}, {594, 98}, {501, 277}, {597, 235}, {77, 469}, {205, 53}, {888, 134}, {26, 165}, {1072, 293}, {489, 193}, {860, 23}, {851, 239}, {1184, 170}, {940, 128}, {894, 135}, {1211, 183}, {180, 250}, {533, 216}, {851, 235}, {174, 191}, {818, 256}, {896, 123}, {628, 209}, {878, 172}, {874, 142}, {457, 143}, {736, 245}, {780, 570}, {256, 417}, {788, 163}, {704, 99}, {859, 306}, {789, 654}, {943, 546}, {113, 450}, {253, 56}, {377, 79}, {794, 533}, {737, 161}, {650, 71}, {1016, 299}, {526, 159}, {858, 167}, {850, 154}, {396, 84}, {649, 152}, {784, 145}, {431, 107}, {1001, 328}, {824, 319}, {559, 107}, {790, 226}, {743, 283}, {337, 193}, {592, 327}, {390, 271}, {1038, 443}, {795, 280}, {1191, 157}, {531, 477}, {1102, 66}, {647, 196}, {847, 87}, {728, 61}, {633, 165}, {385, 110}, {784, 298}, {497, 211}, {569, 594}, {1093, 440}, {555, 426}, {605, 601}, {1077, 209}, {929, 422}, {649, 165}, {410, 123}, {55, 229}, {598, 606}, {420, 136}, {716, 126}, {447, 478}, {561, 393}, {569, 164}, {364, 52}, {599, 522}, {723, 462}, {253, 197}, {604, 282}, {618, 163}, {666, 251}, {510, 159}, {340, 361}, {637, 324}, {228, 115}, {488, 412}, {1012, 201}, {773, 202}, {1185, 227}, {719, 116}, {393, 87}, {260, 57}, {442, 32}, {591, 96}, {670, 272}, {487, 78}, {847, 156}, {1168, 176}, {815, 135}, {803, 269}, {542, 164}, {499, 183}, {542, 138}, {536, 66}, {860, 304}, {555, 171}, {812, 300}, {450, 48}, {390, 335}, {1206, 24}, {610, 233}, {453, 337}, {28, 261}, {259, 246}, {867, 207}, {832, 218}, {759, 251}, {234, 425}, {447, 148}, {657, 126}, {542, 122}, {562, 237}, {477, 199}, {834, 204}, {859, 282}, {981, 66}, {366, 98}, {561, 415}, {750, 145}, {723, 202}, {494, 137}, {635, 174}, {927, 298}, {578, 73}, {775, 12}, {361, 21}, {528, 403}, {779, 134}, {581, 350}, {522, 134}, {653, 128}, {701, 210}};
int[] pixelColor = {};
PImage championImg;
PImage voronoiImg;
int x = 0;
int y = 0;
String[] championNames = {"Aatrox", "Ahri", "Akali", "Alistar", "Amumu", "Anivia", "Annie", "Aphelios", "Ashe", "Aurelion_Sol", "Azir", "Bard", "Blitzcrank", "Brand", "Braum", "Caitlyn", "Camille", "Cassiopeia", "Cho'Gath", "Corki", "Darius", "Diana", "Dr._Mundo", "Draven", "Ekko", "Elise", "Evelynn", "Ezreal", "Fiddlesticks", "Fiora", "Fizz", "Galio", "Gangplank", "Garen", "Gnar", "Gragas", "Graves", "Hecarim", "Heimerdinger", "Illaoi", "Irelia", "Ivern", "Janna", "Jarvan_IV", "Jax", "Jayce", "Jhin", "Jinx", "Kai'Sa", "Kalista", "Karma", "Karthus", "Kassadin", "Katarina", "Kayle", "Kayn", "Kennen", "Kha'Zix", "Kindred", "Kled", "Kog'Maw", "LeBlanc", "Lee_Sin", "Leona", "Lillia", "Lissandra", "Lucian", "Lulu", "Lux", "Malphite", "Malzahar", "Maokai", "Master_Yi", "Miss_Fortune", "Mordekaiser", "Morgana", "Nami", "Nasus", "Nautilus", "Neeko", "Nidalee", "Nocturne", "Nunu", "Olaf", "Orianna", "Ornn", "Pantheon", "Poppy", "Pyke", "Qiyana", "Quinn", "Rakan", "Rammus", "Rek'Sai", "Renekton", "Rengar", "Riven", "Rumble", "Ryze", "Samira", "Sejuani", "Senna", "Seraphine", "Sett", "Shaco", "Shen", "Shyvana", "Singed", "Sion", "Sivir", "Skarner", "Sona", "Soraka", "Swain", "Sylas", "Syndra", "Tahm_Kench", "Taliyah", "Talon", "Taric", "Teemo", "Thresh", "Tristana", "Trundle", "Tryndamere", "Twisted_Fate", "Twitch", "Udyr", "Urgot", "Varus", "Vayne", "Veigar", "Vel'Koz", "Vi", "Viktor", "Vladimir", "Volibear", "Warwick", "Wukong", "Xayah", "Xerath", "Xin_Zhao", "Yasuo", "Yone", "Yorick", "Yuumi", "Zac", "Zed", "Ziggs", "Zilean", "Zoe", "Zyra"};
  
void setup()
{
  size(1215, 717);
  frameRate(20000);

  
  
  
  Voronoi myVoronoi = new Voronoi(points);
  MPolygon[] myRegions = myVoronoi.getRegions();
  
  
  
  for(int i=0; i<myRegions.length; i++)
  {
    // an array of points
    float[][] regionCoordinates = myRegions[i].getCoords();
    noStroke();
    fill(i+1, 20, 20);
    myRegions[i].draw(this); // draw the voronoi (remember to erase this voronoi)
  }
  
  float[][] myEdges = myVoronoi.getEdges();
  
  for (int i=0; i<myEdges.length; i++)
  {
    float startX = myEdges[i][0];
    float startY = myEdges[i][1];
    float endX = myEdges[i][2];
    float endY = myEdges[i][3];
    line( startX, startY, endX, endY );
  }
  
  for(int i = 0; i < points.length;i ++)
  {
    pixelColor = append(pixelColor, get(int(points[i][0]), int(points[i][1])));
  }

saveFrame("0voronoi.png");
voronoiImg = loadImage("0voronoi.png");
}



// TODO: use better (find element in list) method
// Main cause of delay
public void listIndex(int element, int[] list)
{
  int v = 0;
  boolean b = false;

  for(int i=0; i<list.length; i++)
{
  try{
    if (list[i] == element && b == false)
    {
    //println("The index of " + element + " is " + v);
    b = true;
    }
    else if (b == false)
    {
      v ++;
    }
    championImg = loadImage(championNames[v] + "_OriginalSkin.jpg");
  }
  catch(Exception e) {
    championImg = loadImage("delay_screen.jpg");
  }
}
}







void draw()
{
  println("mouse clicked");
  x = mouseX;
  y = mouseY;
  int c = voronoiImg.get(x, y);
  listIndex(c, pixelColor);
  image(championImg, 0, 0);
  //delay(10000);
}
