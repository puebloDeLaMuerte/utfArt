PImage[] imgs;
String folder = "../_sourceImages/small";  

int maxwidth = 0;
int maxheight = 0;
int currentImage = 0;

void initImages() {
  
  String path = sketchPath();
  if( folder != null && folder.length() != 0 ) path += "/"+folder;
  File folder = new File(path);
  File[] listOfFiles = folder.listFiles();
  ArrayList<String> filenames = new ArrayList<String>();

  for (int i = 0; i < listOfFiles.length; i++) {
    if (listOfFiles[i].isFile()) {
      String f = listOfFiles[i].getName();
      System.out.println("File " + f);

      if ( f.endsWith(".JPG") || f.endsWith(".jpg") || f.endsWith(".png") || f.endsWith(".jpeg") )
        filenames.add( f );
    } else if (listOfFiles[i].isDirectory()) {
      System.out.println("Directory " + listOfFiles[i].getName());
    }
  }

  imgs= new PImage[filenames.size()];
  for (int i = 0; i < imgs.length; i++) {
    imgs[i] = loadImage(folder+"/"+filenames.get(i));
    if ( imgs[i].width  > maxwidth ) maxwidth = imgs[i].width;
    if ( imgs[i].height > maxheight ) maxheight = imgs[i].height;
  }
  
}
