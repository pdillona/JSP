package kr.co.jboard2.dto;

import kr.co.jboard2.db.DBHelper;

public class FileDTO extends DBHelper{

	private int fno;
	private int ano;
	private String ofile;
	private String sfile;
	private int download;
	private String rdate;
	
	
	//추가필드
	private String nick;
	private FileDTO fileDto;
	
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public FileDTO getFileDto() {
		return fileDto;
	}
	public void setFileDto(FileDTO fileDto) {
		this.fileDto = fileDto;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public int getDownload() {
		return download;
	}
	public void setDownload(int download) {
		this.download = download;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	//dto속성 출력하는 문자열
	@Override
	public String toString() {
		return "FileDTO [fno=" + fno + ", ano=" + ano + ", ofile=" + ofile + ", sfile=" + sfile + ", download="
				+ download + ", rdate=" + rdate + ", nick=" + nick + ", fileDto=" + fileDto + "]";
	}
	
}
