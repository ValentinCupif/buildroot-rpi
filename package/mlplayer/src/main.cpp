#define _BUILD_TIME_ __TIME__
#define _BUILD_DATE_ __DATE__

#include <QApplication>

#include <QMediaPlaylist>

#include "mlplayer.h"

#ifdef _VERBOSE_
#include <iostream>
#endif

#ifdef _VERBOSE_
void MessageHandler ( QtMsgType type, const QMessageLogContext& context, const QString& message )
{
/*
black - 30
red - 31
green - 32
brown - 33
blue - 34
magenta - 35
cyan - 36
lightgray - 37
*/

	std::cerr
		<< QCoreApplication::instance ()->applicationName().toStdString()
//		<< " : [ version ] "
//		<< context.version
		<< " : [ file ] "
		<< "\033[0;31m" << context.file << "\033[0m"
		<< " : [ line ] "
		<< "\033[0;35m" << context.line << "\033[0m"
//		<< " : [ category ] "
//		<< context.category
		<< " : [ type ] "
		<< "\033[0;36m";

	switch ( type )
	{
		case QtDebugMsg		: std::cerr << "debug"; break;
		case QtWarningMsg	: std::cerr << "warning"; break;
		case QtCriticalMsg	: std::cerr << "critical"; break;
		case QtFatalMsg		: std::cerr << "fatal"; break;
		default			:;
	}

	std::cerr
		<< "\033[0m"
		<< " : [ function ] "
		<<  "\033[0;34m" << context.function << "\033[0m"
		<< " : [ message ] "
		<< "\033[0;32m" << message.toStdString() << "\033[0m"
		<< std::endl;
}
#endif

int main(int argc, char * argv[])
{
	QApplication app(argc, argv);

#ifdef _VERBOSE_
	qInstallMessageHandler ( MessageHandler );
#endif

	qDebug () << "METROLOGICAL : media player release (" << _BUILD_DATE_ << _BUILD_TIME_ <<")";

#ifndef _MOUSE_
        qDebug () << "METROLOGICAL : hide mouse pointer";
	QApplication::setOverrideCursor ( QCursor ( Qt::BlankCursor ) );
#endif

	QUrl url;
	if (argc > 1)
		url = QUrl(argv[1]);
	else
	{
		qDebug () << "METROLOGICAL : provide a valide (URL) file to play";;
		return EXIT_FAILURE;
	}

qDebug () << "METROLOGICAL";

	Player player(&app);

qDebug () << "METROLOGICAL";

	QMediaPlaylist playlist;

qDebug () << "METROLOGICAL";

	playlist.addMedia(url);

qDebug () << "METROLOGICAL";
playlist.setCurrentIndex(0); 

qDebug () << "METROLOGICAL";

//	player.setPlaylist(&playlist);
	player.setMedia(url);

qDebug () << "METROLOGICAL";

	QVideoWidget videoWidget;
	player.setVideoOutput(&videoWidget);
	videoWidget.show();

player.play();

	return app.exec();
}
