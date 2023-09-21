#include <iostream>
#include <cstdint>

//#define PRINT_DEBUG_INFO

union FieldExtractor
{
	unsigned long long instruction;

	//Use for Little Endian
	/*
	struct
	{
		uint32_t code : 5; //opcode
		uint32_t ladrm : 4; //left address mode
		uint32_t radrm : 4; //right address mode
		uint32_t si : 7; //short immediate
		uint32_t lreg : 6; //left register
		uint32_t rreg : 6; //right register
		uint32_t li : 32; //long immediate
	};
	*/
	//Use for Big Endian
	struct
	{
		uint32_t li : 32;
		uint32_t rreg : 6;
		uint32_t lreg : 6;
		uint32_t si : 7;
		uint32_t radrm : 4;
		uint32_t ladrm : 4;
		uint32_t code : 5;
	};
};

void readStuff(const unsigned long long& instruction)
{
	FieldExtractor extractor;

	extractor.instruction = instruction;

	std::cout << std::dec << "rreg = " << extractor.rreg << std::endl;
	std::cout << "lreg = " << extractor.lreg << std::endl;
	std::cout << "si = " << extractor.si << std::endl;
	std::cout << "radrm = " << extractor.radrm << std::endl;
	std::cout << "ladrm = " << extractor.ladrm << std::endl;
	std::cout << "code = " << extractor.code << std::endl;
	std::cout << "li = " << extractor.li << std::endl;
}

int main()
{
#if defined(PRINT_DEBUG_INFO)
	std::cout << "Size of FieldExtractor union: " << sizeof(FieldExtractor) << " bytes" << std::endl;
#endif

	uint64_t hexInstruction = 0;

	std::cout << "Enter a 64 bit instruction in Hex format, or enter q to exit" << std::endl;
	while (std::cin >> std::hex >> hexInstruction)
	{	
		if(hexInstruction == 'q')
			return 0;

		std::cout << "Instruction: Ox" << std::hex << hexInstruction << std::endl;
		std::cout << std::dec;

		readStuff(hexInstruction);
		std::cout << std::endl;
	}
	return 0;
}
