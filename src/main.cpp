#include "labelmaker.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    LabelMaker *labelmaker = new LabelMaker;
    
    labelmaker->showMaximized();

    return app.exec();
}
